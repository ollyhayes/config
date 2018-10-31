#DRYRUN=--dry-run
#DELETE=--delete

SCUFFED_UUID=7badf970-9e95-4402-9023-e08c8fa3c318
UNSCUFFED_UUID=4f04022b-78f1-44d0-b47b-897a1075ed87

set -e

date

if [ -L /dev/disk/by-uuid/$SCUFFED_UUID ] # -L symlink exists
then
	echo "Found scuffed disk - mounting"
	mount /dev/disk/by-uuid/$SCUFFED_UUID /mnt/backup-drive/
elif [ -L /dev/disk/by-uuid/$UNSCUFFED_UUID ]
then
	echo "Found non-scuffed disk - mounting"
	mount /dev/disk/by-uuid/$UNSCUFFED_UUID /mnt/backup-drive/
else
	>&2 echo "No disk found, exiting"
	echo "No disk found, exiting" # make this echo to both error and message so it gets saved into the log? or get cron to tee it to both
	exit 1
fi

echo "Backing up data..."
rsync  -avslh $DRYRUN $DELETE /mnt/data/root/data /mnt/backup-drive/root --exclude data/Games/minecraft-server-old --exclude data/Games/minecraft-server/plugins/dynmap

echo "Backing up photos..."
rsync  -avslh $DRYRUN $DELETE /mnt/data/root/media/Photos /mnt/backup-drive/root/media

echo "Backing up music..."
rsync  -avslh $DRYRUN $DELETE /mnt/data/root/media/Music /mnt/backup-drive/root/media

echo "Backing up gopro videos..."
rsync  -avslh $DRYRUN $DELETE /mnt/data/root/media/GoPro /mnt/backup-drive/root/media

echo "Unmounting drive"
umount /mnt/backup-drive
echo "Done!"

date 

