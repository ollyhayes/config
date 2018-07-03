for projectName in $(ls -l ~/tools | grep ^d | grep --only-matching "[^ ]*$")
do
	directory=$(echo ~/tools/$projectName)
	gitDirectory=$directory/.git
	gitArgs="--git-dir=$gitDirectory --work-tree=$directory"

	if [ -d $gitDirectory ]
	then
		shortStatus=$(git $gitArgs status --short) # empty unless changes
		branchStatus=$(git $gitArgs status --short --branch) # may contain "ahead"

		if [ "$shortStatus" != "" ] || echo $branchStatus | grep -q "ahead"
		then
			echo "$projectName:"
			git $gitArgs status --short --branch
			# warn if branch isn't set up to track origin?
			echo ""
		fi
	fi
done
