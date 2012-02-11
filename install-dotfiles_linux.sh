#! /usr/intel/bin/bash -x

# CAUTION - this script does not properly handle directories/files with spaces in their names
copiedfiles=""
problemfiles=""
skippedfiles=""
retval=0
dest=$HOME
if [ $# -gt 0 ]; then
    dest=$1
    echo "Destination directory set to: '$dest'"
else
    echo "Writing to HOME: '$HOME'"
fi
if [ ! -d $dest ]; then
    echo "ERROR: Cannot write to destination: '$dest'"
    echo "...aborting.."
    exit 1
fi
echo "Destination directory set to: '$dest'"

for f in `ls`; do
    if [ "$f" != "undot-dotfiles.sh" -a "$f" != "install-dotfiles.sh" ]; then
	newname=".$f"
	if [ -r $f ]; then
	    echo -n "Copying '$f' to '$newname': "
	    #echo "CMD: cp -i $f $dest/$newname"
	    cp -i $f $dest/$newname
	    if [ $? -ne 0 ]; then
		problemfiles="$problemfiles$f "
		retval=1
	    else
		copiedfiles="$copiedfiles$f=>$dest/$newname "
	    fi
	    echo
	else
	    echo "Could not read '$f' - skipping copy"
	    skippedfiles="$skippedfiles$f "
	fi
    else
	skippedfiles="$skippedfiles$f "
    fi
done

if [ -n "$copiedfiles" ]; then
    echo
    echo "Successfully copied: "
    for f in $copiedfiles; do
	echo "	$f"
    done
fi

if [ -n "$skippedfiles" ]; then
    echo
    echo "These files were skipped: "
    for f in $skippedfiles; do
	echo "	$f"
    done
fi

if [ -n "$problemfiles" ]; then
    echo
    echo "Problems copying: "
    for f in $problemfiles; do
	echo "	$f"
    done
fi

exit $retval

