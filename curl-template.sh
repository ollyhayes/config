args=(
	-x localhost:8888
	# -o download.dat
	# --data-binary @file.txt
	# --data '' #(Makes POST)
	# -u olly_hayes:[password]
	-H "Accept: application/vnd.fl.groupfunddata.json"
	-H "Cache-Control: max-age=0"
	# -H "User-Agent:"
	# -H "Accept-Encoding: gzip, deflate"
	# -H "Accept:"
)

curl "${args[@]}" "insert-url-here"

# -x proxy
# -o output file
# -s silent (hide progress bar)
# -w with format file
# -H header
