#!/bin/bash

mkdir -p ~/.crawl/conf.d/HilariousDeathArtist/DCSSConfigFile
cd !$
git clone git@github.com:HilariousDeathArtist/DCSSConfigFile.git .
# copy *.txt to *.rc
find . -name '*.txt' -exec sh -c 'cp "$1" "${1%.txt}.rc"' _ {} \;
cd -

# write the macro.txt file (if doesn't exists)
if [ ! -f ~/.crawl/macro.txt ]; then
    echo "M:o" >> ~/.crawl/macro.txt
    echo "A:===HDAtravel" >> ~/.crawl/macro.txt
fi

if [ -f ~/.crawlrc ]; then
    cp ~/.crawlrc ~/.crawlrc.bk
    echo "Creating .crawlrc backup in .crawlrc.bk"
fi

INCLU='include += ./.crawl/conf.d/HilariousDeathArtist/DCSSConfigFile/HilariousDeathArtist.rc'
if ! grep -q "$INCLU" ~/.crawlrc; then
    echo $INCLU >> ~/.crawlrc
fi

echo "Installation done."
