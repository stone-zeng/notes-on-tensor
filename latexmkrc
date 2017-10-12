# Latexmk configuration file.

# Use XeLaTeX to compile.
$pdf_mode = 5;

# Process index.
$makeindex = 'zhmakeindex -s notes.ist -z pinyin -o %D %S';

# Show CPU time used.
$show_time = 1;
