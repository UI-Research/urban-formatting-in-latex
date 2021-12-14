% Urban Institute White Paper Formatting for LaTeX
%
% Based on the Urban Institute's formatting standards for short reports.
%
% ==============================
% Copyright 2021 Claire McKay Bowen, Ph.D.
% ==============================
%
% Notes -----------------------------------
% \newcommand defines a new command, and makes an error if it is already defined.
% \renewcommand redefines a predefined command, and makes an error if it is not yet defined.
% \providecommand defines a new command if it isn't already defined.
%
% \newcommand{<name>}[<args>]{ <code> }
% \fontsize{10}{12}\selectfont (the first number is the pt size of the font, the second number the space in pts between lines: this becomes the value of \baselineskip
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Meta Data and Defaults %%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{urban-formatting}
\LoadClass[twoside]{article} 
\usepackage[top = 1.13in, left = 1.13in, bottom = 1.2in, right = 1.13in, paperheight = 11in, paperwidth = 8.5in]{geometry}

% Packages -----------------------------------
\RequirePackage{% Default
    array, % Table Column Width
    caption, % Figure/Table Caption Formatting
    color, % Color text
    csquotes, % Typesets quotes
    endnotes, % Footnote Formatting
    enumitem, % Itemize Formatting
    fancyhdr, % Header/Footer Formatting
    graphicx, % Figure package
    multicol, % Create Multi-columns
    multirow, % Create Multi-rows
    pdfpages, % Insert pdfs
    ragged2e, % Alignment 
    scrextend, % Adding margin
    setspace, % Line Spacing
    subcaption, % Figure/Table Subaption Formatting
    tabularx, % Table Management
    titlesec, % Change Formatting
    tocloft, % For ToC Formatting
    xcolor % Defining new colors
}

% Color Box for footers, headers, etc.
\RequirePackage[most]{tcolorbox}
% Absolute positioning of images (e.g., title page footer image)
\RequirePackage[absolute]{textpos}
% Chicago Reference
\RequirePackage[authordate, autocite = inline, backend = biber, isbn = false, natbib]{biblatex-chicago}
% Colored URL
\usepackage[colorlinks = true,
            linkcolor = black,
            urlcolor  = urban-url,
            citecolor = black,
            anchorcolor = black]{hyperref}
% Letter spacing
\usepackage[letterspace=1]{microtype}

% Urban Colors -----------------------------------
\definecolor{urban-url}{HTML}{0a4c6a}

% General Formatting -----------------------------------
\renewcommand{\baselinestretch}{1.5} % 1.5 spacing
\raggedright % Left justified
\setlength{\parindent}{0.5in} % Paragraph indents
\setlength{\parskip}{8pt} % Paragraph spacing
\setcounter{tocdepth}{2} % TOC listing depth
\setcounter{secnumdepth}{-1} % Suppressing numbering on sections
\setlength{\unitlength}{1in} % Setting unit length for creating the footers
\setlist[itemize]{topsep=0pt} % Bullet spacing
\setlist[enumerate]{topsep=0pt} % Bullet spacing
\usepackage[labelsep=period, labelfont=bf]{caption}
% Fixing the hyphenation issues
\emergencystretch=\maxdimen
\hyphenpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bullets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spacing between bullet and text
\setlist[itemize, 1]{leftmargin = 0.75in, labelsep = 4.5mm}
\setlist[enumerate, 1]{leftmargin = 0.75in, labelsep = 3mm}

\setlist[enumerate, 2]{label=\alph*.}

% Blue Square Bullet
\newcommand{\squarebullet}{{\raisebox{.5ex}{\rule{0.7ex}{0.7ex}}}}
\renewcommand{\labelitemi}{\squarebullet}

% Double arrow bullet
\newcommand{\doublearrow}{\fontseries{mb}\selectfont >>}
\renewcommand{\labelitemii}{\doublearrow}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Quote %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Block Text Style Formatting
\newcommand{\quoteblock}[1]{%
    {%
        \begin{addmargin*}[0in]{0.5in}
            \fontsize{11}{8}%
            \selectfont%
            #1%
        \end{addmargin*}
    }%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fonts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title Call
\def\title#1{\gdef\@title{#1}\gdef\THETITLE{#1}}

% To be filled
\newcommand{\tbf}{\textcolor{red}}%

% Defining set fonts
\def\normalsize{\fontsize{12}{12}}%
\def\enotesize{\fontsize{10}{0}}

% Part Formatting - H1
\titleformat{\part}[display]{}{\thepart}{}{\bfseries\fontsize{22}{24}\selectfont\raggedright}%
\titlespacing*{\part}{0pt}{-22pt}{0pt}%

% Section Formatting - H2
\titleformat{\section}[display]{}{}{}{\bfseries\fontsize{18}{8}\selectfont\raggedright}%
\titlespacing*{\section}{0pt}{12pt}{0pt}%

% Subsection Formatting - H3
\titleformat{\subsection}[display]{}{}{}{\bfseries\fontsize{12}{18}\selectfont\raggedright}%
\titlespacing*{\subsection}{0pt}{0pt}{0pt}%

% Subsubsection Formatting - H4
\titleformat{\subsubsection}[display]{}{}{}{\itshape\fontsize{12}{12}\selectfont\MakeUppercase\raggedright}% 18 to 12, 6 to 4 (divide by 1.5 spacing)
\titlespacing*{\subsubsection}{0pt}{8pt}{0pt}%

% Title Report Formatting
\newcommand\titlereport[1]{%
    {%
    \begin{doublespace}%
        \fontsize{18pt}{38pt}%
        \fontseries{b}%
        \linespread{1}%
        \selectfont%
        \noindent#1%
    \end{doublespace}%
    }%
}%

% Report Subtitle Formatting
\newcommand\reportsubtitle[1]{%
    {%
        \fontsize{14}{18pt}%
        \linespread{1}%
        \selectfont%
        \noindent%
        \textbf{\textit{#1}}%
    }%
}%

% Author Name and Affiliation Formatting
\newcommand\authorfont[1]{%
    \fontsize{12}{0}%
    \selectfont%
    \noindent%
    \textit{#1}%
}%

% Title Footer Text Formatting
\newcommand\titlefooter[1]{%
    \fontsize{11}{2}%
    \selectfont%
    \noindent%
    #1%
}%

% fourthsub Formatting - H5
\newcommand\fourthsub[1]{%
    {%
        \fontsize{12}{12}%
        \selectfont%
        \noindent\textbf{\textit{#1}}%
    }%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figures and Tables %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% New commands to manually adjust table widths
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% setting the column space to 0
\setlength{\tabcolsep}{0pt}

% Source/Notes Formatting
\newcommand{\source}[1]{%
    {%
        \fontsize{10}{0}%
        \selectfont%
        \noindent%
        #1%
    }%
}%

% Heading Title
\newcommand{\tabheader}[1]{%
    {%
        \fontsize{10}{0}%
        \fontseries{b}%
        \selectfont%
        \noindent%
        #1%
    }%
}%

% Row Heading Title
\newcommand{\rowheader}[1]{%
    {%
        \fontsize{10}{0}%
        \fontseries{b}%
        \selectfont%
        \noindent%
        #1%
    }%
}%

% Row Subheading Title
\newcommand{\rowsubheader}[1]{%
    {%
        \fontsize{10}{0}%
        \fontshape{it}%
        \selectfont%
        \noindent%
        #1%
    }%
}%

% Table Font
\newcommand{\tabfont}[1]{%
    {%
        \fontsize{10}{0}%
        \selectfont%
        \noindent%
        #1%
    }%
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Notes and References %%%%%%%%%%%%%%%%%%%%%%%%%%
% Endnote font size
\renewcommand\enotesize{\fontsize{9}{9}\selectfont}

% Mark with no indent and hanging indent
\renewcommand\enoteformat{%
   \noindent$^\theenmark$\hspace{0.05in}\ \hangindent 0.55\parindent%
}

% Reference font formatting
\renewcommand*{\bibfont}{\fontsize{9}{9}\selectfont}

% Hanging indent
\setlength{\bibhang}{0.15in}

% Changing et al
\DefineBibliographyStrings{english}{andothers={and colleagues}}