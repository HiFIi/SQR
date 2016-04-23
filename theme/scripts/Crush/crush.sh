#!/bin/sh

# THIS IS NOT MINE!
# I can't remember where I found this awesome script, but when
# I find the link, I will post it in here, along with the author of
# said script, but again.. THIS IS NOT MY CODE!!!


for png in `find $1 -name "*.png"`;
do
	echo "crushing $png"	
	pngcrush -brute "$png" temp.png
	mv -f temp.png $png
done;
