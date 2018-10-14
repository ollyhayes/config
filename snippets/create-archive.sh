echo "creating backup named $1 of $2..."

tar -cvpzf $1 \
	--exclude=$2proc \
	--exclude=$2tmp \
	--exclude=$2mnt \
	--exclude=$2dev \
	--exclude=$2sys \
	--exclude=$2run \
	$2

# -c create tar
# -v verbose
# -p preserve permissions
# -z gzip
# -f filename or tar (next arg)
