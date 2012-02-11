#! /usr/intel/bin/bash -x

# CAUTION - this script does not properly handle directories/files with spaces in their names
movedfiles=""
problemfiles=""
skippedfiles=""
retval=0
for f in `ls -a`; do
    if [ "$f" != "." -a "$f" != ".." -a "$f" != ".git" -a "${f:0:1}" = "." -a "${f:(-4)}" != ".swp" ]; then
	newname=`echo $f | cut -b 2- -`
	if [ -r $f ]; then
	    echo -n "Moving '$f' to '$newname': "
	    echo "CMD: mv -i $f $newname"
	    #mv -i $f $newname
	    if [ $? -ne 0 ]; then
		problemfiles="$problemfiles$f "
		retval=1
	    else
		movedfiles="$movedfiles$f=>$newname "
	    fi
	    echo
	else
	    echo "Could not read '$f' - skipping move"
	    skippedfiles="$skippedfiles$f "
	fi
    fi
done

if [ -n "$movedfiles" ]; then
    echo "Successfully moved: "
    for f in $movedfiles; do
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
    echo "Problems moving: "
    for f in $problemfiles; do
	echo "	$f"
    done
fi

exit $retval

