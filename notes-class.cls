\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{notes-class}{2018/10/09}{0.1}{notes-class}

\PassOptionsToPackage { log-declarations=false } { xparse }

\LoadClass [ UTF8, fontset = none ] { ctexbook }
\RequirePackage
  {
    amsmath,
    enumitem,
    fancyhdr,
    geometry,
    graphicx,
    % mathtools,
    tensor,
    physics,
    unicode-math,
    xcolor,
    tabularx,
    arydshln
  }
\RequirePackage [ ntheorem          ] { empheq   }
\RequirePackage [ thmmarks, amsmath ] { ntheorem }
\RequirePackage { hyperref }

\ctexset
  {
    section    / format  += { \normalfont \sffamily },
    subsection / format  += { \normalfont \sffamily },
    subsection / tocline  = { \kaishu \CTEXnumberline{#1}#2 },
    contentsname = { 目 \quad 录 }
  }

\geometry
  {
    paper      = a4paper,
    hmargin    = 2.54 cm,
    vmargin    = 3.18 cm,
    % headheight = 3 cm,
    % marginparwidth = 1.8 cm
  }

\hypersetup
  {
    bookmarksnumbered = true,
    linktoc           = page,
    colorlinks        = true,
    % linkcolor = {red!60!black},
    % citecolor = {green!50!black},
    % urlcolor = {blue!70!black}
  }
\pdfstringdefDisableCommands
  { \cs_set_eq:NN \kaishu \prg_do_nothing: }

% TODO
\setmainfont { XITS }
  [
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic
  ]
\setsansfont { TeX~ Gyre~ Heros  }
\setmonofont { TeX~ Gyre~ Cursor }

\unimathsetup
  {
    math-style   = ISO,
    bold-style   = ISO,
    mathrm       = sym,
    warnings-off = { mathtools-colon, mathtools-overbracket }
  }
% \setmathfont { XITS~ Math }
\setmathfont { XITSMath-Regular.otf }  [ BoldFont = XITSMath-Bold.otf ]

\defaultCJKfontfeatures
  {
    Script         = CJK,
    Mapping        = fullwidth-stop,
    BoldFont       = *,
    ItalicFont     = *,
    BoldItalicFont = *
  }
\setCJKmainfont { FZGFShuSong    }
  [ BoldFont = FZHei-B01, ItalicFont = FZKai-Z03, BoldItalicFont = FZKai-Z03 ]
\setCJKsansfont { FZHei-B01      }
\setCJKmonofont { FZFangSong-Z02 }
\newCJKfontfamily \kaishu { FZKai-Z03 }

\cs_set:Npn \thefootnote
  { \symbol { \int_eval:n { "2460 - 1 + \int_use:N \c@footnote } } }
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \hfil }
    #1
  }

\fancyhf { }
\fancyhead [ EL ] { \small \nouppercase { \kaishu \leftmark  } }
\fancyhead [ OR ] { \small \nouppercase { \kaishu \rightmark } }
\fancyfoot [ C  ] { \small \thepage }
\cs_set:Npn \headrulewidth { 0 pt }
\cs_set:Npn \cleardoublepage
  {
    \clearpage
    \int_if_odd:nF \c@page
      { \hbox:n { } \thispagestyle { empty } \newpage }
  }
\pagestyle { fancy }

\group_begin:
  \theoremstyle      { nonumberplain        }
  \theoremheaderfont { \bfseries            }
  \theorembodyfont   { \normalfont          }
  \theoremsymbol     { \ensuremath { \QED } }
  \newtheorem { myProof } { 证明： }
\group_end:

\NewDocumentEnvironment { mySubEq } { }
  { \@@_sub_eq_begin: }
  { \@@_sub_eq_end:   }
\cs_new:Npn \@@_sub_eq_begin:
  {
    \subequations
    \cs_set:Npn \theequation
      { \theparentequation - \alph { equation} }
  }
\cs_new:Npn \@@_sub_eq_end:
  { \endsubequations \ignorespacesafterend }

\NewDocumentEnvironment { braceEq  } { O { align } }
  { \@@_brace_eq_begin:nn {#1} { \empheqlbrace } }
  { \@@_brace_eq_end: }
\NewDocumentEnvironment { braceEq* } { O { align } m }
  { \@@_brace_eq_begin:nn {#1} { { \displaystyle #2 } \empheqlbrace } }
  { \@@_brace_eq_end: }
\cs_new:Npn \@@_brace_eq_begin:nn #1#2
  {
    \@@_sub_eq_begin:
    \setkeys { EmphEqEnv } {#1}
    \setkeys { EmphEqOpt } { left = {#2} }
    \EmphEqMainEnv
  }
\cs_new:Npn \@@_brace_eq_end:
  {
    \endEmphEqMainEnv
    \@@_sub_eq_end:
  }

\newenvironment{myEnum}
  {\enumerate}
  {\endenumerate}

\cs_set:Npn \maketitle
  {
    \begin{titlepage}
      \begin{center}
        \vspace * { 2 cm }
        { \zihao {0} \bfseries \@title } \par
        \vspace { 2 cm }
        { \LARGE \@author }
        \vspace { 15 cm } \par
        { \LARGE \kaishu \@date }
      \end{center}
    \end{titlepage}
  }
