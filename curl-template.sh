args=(
	# -x localhost:8888
	# -o download.dat
	# --data-binary @file.txt
	# --data-urlencode ids@Data.txt
	# --data '' #(Makes POST)
	# -u olly_hayes:[password]
	# -H "Accept: application/vnd.fl.groupfunddata.json"
	-H "Cache-Control: max-age=0"
	# -H "User-Agent:"
	# -H "Accept-Encoding: gzip, deflate"
	# -H "Accept:"
	# -k
)

curl "${args[@]}" "insert-url-here"

# -H header
# -k dont worry about certificate
# -o output file
# -s silent (hide progress bar)
# -S show errors (even if silent)
# -w with format file
# -x proxy
