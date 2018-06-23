for file in *.avi
do
	ffmpeg -i "$file" -map 0:v:0 -map 0:a:1 -map 0:a:0 -c copy "${file/ITA-ENG/ENG-ITA}"
done
