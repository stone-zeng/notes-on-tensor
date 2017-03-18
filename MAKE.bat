SET name=Notes_Chapter_1-7

xelatex -jobname=%name% Notes
zhmakeindex -s MyIndexStyle.mst -z pinyin %name%
xelatex -jobname=%name% Notes
xelatex -jobname=%name% Notes
