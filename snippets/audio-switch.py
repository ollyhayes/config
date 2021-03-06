from subprocess import run, Popen, PIPE
from datetime import datetime
import re

# inspired by https://unix.stackexchange.com/a/67398

def findMatch(regex, row):
	"""find and return single regex group match"""
	matches = re.findall(regex, row)
	return next((match for match in matches), None)

def getOutput(command):
	"""run command in shell and return stdout as string"""
	output = run(command, shell=True, capture_output=True)
	return output.stdout.decode("utf-8")

def getApplications():
	"""find relevant applications and their sink-ids"""
	output = getOutput("pactl list sink-inputs")

	applications = {
		"spotify": {
			"regex": r'spotify'
		},
		"vlc": {
			"regex": r"VLC"
		},
		"firefox": {
			"regex": r'Firefox'
		}
	}

	current_sink_id = None
	for row in output.split('\n'):

		sink_id = findMatch(r'Sink Input #(\d+)', row)
		if sink_id is not None:
			current_sink_id = sink_id

		found_application_name = findMatch(r'application.name = \"(.*)\"', row)

		if found_application_name is not None:
			for application_name in applications:
				if re.search(applications[application_name]['regex'], found_application_name):
					applications[application_name]['sink_id'] = current_sink_id

	return applications

def getSinks():
	"""find relevant sinks and their sink-ids"""
	output = getOutput("pactl list short sinks")

	sinks = {
		"line-out": {
			"regex": r'pci.*analog-stereo'
		},
		"boom": {
			"regex": r"blue"
		},
	}

	for row in output.split('\n'):
		for sink_name in sinks:
			if re.search(sinks[sink_name]['regex'], row):
				sinks[sink_name]['sink_id'] = findMatch(r'^(\d+)', row)

	return sinks

def switchAllToSink(sink_id, applications):
	"""set all applications to use specified sink"""
	run(f"pactl set-default-sink {sink_id}", shell=True)

	for application_name in applications:
		if "sink_id" in applications[application_name]:
			application_sink_id = applications[application_name]["sink_id"]
			command = f"pactl move-sink-input {application_sink_id} {sink_id}"
			print(f"running command: {command}")
			run(command, shell=True)

def subscribe(callback):
	"""call callback when connected sink list is modified"""
	proc = Popen(["pactl", "subscribe"], stdout=PIPE, encoding="utf-8")

	while True:
		line = proc.stdout.readline()
		if "sink" in line:
			callback()

current_default_sink = "line-out"

def handleSinksChanged():
	"""set all applications to use boom if connected, otherwise use line-out"""
	global current_default_sink
	sinks = getSinks()
	boom = sinks['boom']

	if "sink_id" in sinks["boom"]:
		if current_default_sink == "line-out":
			print("switching to boom")
			switchAllToSink(sinks["boom"]["sink_id"], getApplications())
			current_default_sink = "boom"
	else:
		if current_default_sink == "boom":
			print("switching to line-out")
			switchAllToSink(sinks["line-out"]["sink_id"], getApplications())
			current_default_sink = "line-out"

subscribe(handleSinksChanged)