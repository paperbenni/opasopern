#!/bin/bash
if [ ! -n "$1" ]; then
	echo "du musst noch sagen welches video du haben willst"
	exit
fi

transfer() {
	if [ $# -eq 0 ]; then
		echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
		return 1
	fi
	tmpfile=$(mktemp -t transferXXX)
	if tty -s; then
		basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        tmpfile=youtube.txt
		curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >>$tmpfile
	else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >>$tmpfile; fi
    echo ""
	cat $tmpfile
    echo ""
	rm -f $tmpfile
}

mkdir youtube
cd youtube
echo "warte kurz..."
youtube-dl -o opa.mp4 "$1"
for file in *
do
ffmpeg -i $file opa.avi
rm $file
transfer opa.avi
rm opa.avi
done
cd ..
rm -r youtube
