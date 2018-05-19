#!/bin/bash

OUTPUT=~/storage/documents
CPT_FILE=~/storage/documents/passwords.cpt

read -sp "Enter decryption key: " PASSWORD
echo

export PASSWORD

echo Decrypting...
ccat --envvar PASSWORD $CPT_FILE | tar -xC $OUTPUT

read -p "Finished. Update data (y/N)?"

if [ "$REPLY" == "y" ]
then
	echo Re-encrypting...
	tar -cC $OUTPUT $OUTPUT/data | ccencrypt --envvar PASSWORD > $CPT_FILE
fi

rm $OUTPUT/data -R
echo Done!
