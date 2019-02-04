\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tehranDLDL}

\LoadClass{article}
\RequirePackage{kvoptions}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{amssymb}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{pstricks}
\RequirePackage{pst-barcode}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{tocbibind}
\RequirePackage{tikz}
\RequirePackage[inline]{enumitem}
\RequirePackage[exponent-to-prefix]{siunitx}
\RequirePackage{fontspec}
\RequirePackage[title,toc,page]{appendix}
\RequirePackage{soul}
\RequirePackage{listings}
\RequirePackage[plain]{fancyref}
\RequirePackage[colorlinks, citecolor=Green, linkcolor=Red, filecolor=Cyan, urlcolor=Magenta]{hyperref}

\DeclareStringOption[ut]{logo}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessKeyvalOptions*

\makeatletter

\AtBeginDocument{
    \let\thetitle\@title
    \let\theauthor\@author
    \let\thedate\@date

    % setup fancyhdr
    \fancypagestyle{plain}{
        \fancyhf{}
        \fancyhead[C]{\thecourseshort\quad{\bfseries \thetitle}\dotfill\thepage}
        \fancyfoot[L]{
            \small \textsc{\copyright{} \thecourse, \theuniversity, \thedate}\newline
            \footnotesize Prepared and developed by \thepreparer{} under supervision of \thesupervisor{}
        }
    }
    \pagestyle{plain}

    \hypersetup{pdftitle=\thetitle}
    \hypersetup{pdfauthor=\theauthor}
    \hypersetup{pdfsubject={\thecourseshort{} :: \thetitle{}}}

    \lstset{
        language=Verilog,
        basicstyle=\footnotesize\ttfamily,
        keywordstyle=\bfseries\color{NavyBlue},
        commentstyle=\color{Green},
        showstringspaces=false,
    }
    \setmonofont{Courier New}
    \tolerance=5000
}

\newcommand{\maketitlepage}{
    \begin{titlepage}%
        \let\footnotesize\small
        \let\footnoterule\relax
        \let \footnote \thanks
        \null\vfil
        \vskip 20\p@
        \begin{center}%
            {\rule{0.7\textwidth}{0.5pt}\par}
            % {\includegraphics[height = 7em]{\tehranDLL@logo} \par}%
            \begin{figure}[H]
            \centering
            \resizebox{!}{20ex}{\input{\tehranDLDL@logo}}
            \end{figure}
            {\Large \bfseries \theuniversity \par}%
            {\large \thecollege \par}%
            {\rule{0.7\textwidth}{0.5pt}\par}
            \vskip 6em%
            {\LARGE \thesuptitle \par}%
            {\Large \thesupsubtitle \par}%
            {\LARGE \bfseries \@title \par}%
            {\rule{0.8\textwidth}{1pt}\par}
            {\Large \thecourse \par}%
            {\Large \thecoursecode \par}%
            {\large Laboratory Manual \par}%
            \vskip 3em%
            {\thedate \par}%
            {\vskip 3em}%
            % \href{\thecourseulr}{%
                % {\psframebox{
                    \begin{pspicture}(0.91in,0.91in)
                        \psbarcode[linecolor=Black]{\thecourseulr}{}{qrcode}
                    \end{pspicture}
                % }}
            % }
        \end{center}\par
        \@thanks
        \vfil\null
        \newpage
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}
\renewcommand{\maketitle}{\maketitlepage}
\newcommand{\university}[1]{\def\theuniversity{#1}}
\newcommand{\suptitle}[1]{\def\thesuptitle{#1}}
\newcommand{\supsubtitle}[1]{\def\thesupsubtitle{#1}}
\newcommand{\college}[1]{\def\thecollege{#1}}
\newcommand{\course}[2][]{
    \def\thecourse{#2}
    \def\thecourseshort{#1}\ifx\thecourseshort\empty \def\thecourseshort{#2} \fi
}
\newcommand{\coursecode}[1]{\def\thecoursecode{#1}}
\newcommand{\courseurl}[1]{\def\thecourseulr{#1}}
\newcommand{\supervisor}[1]{\def\thesupervisor{#1}}
\newcommand{\preparer}[1]{\def\thepreparer{#1}}

\newcommand\ol[1]{{\setul{-0.9em}{}\ul{#1}}}

\makeatother

\newcommand{\designverification}{
    \begin{center}\begin{tikzpicture}
        \node[ultra thick,rectangle,draw=black!72,rounded corners=1em,inner xsep=2em,inner ysep=2ex](mainbox){%
            \begin{minipage}{\dimexpr(\textwidth - 4em)}
                {\large\bfseries Design Verification\par}
                {\vspace{2ex}}
                \begin{itemize}[label={\mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$~\hidewidth\cr}}},leftmargin=*,topsep=2ex,partopsep=2ex]
                    \item Demonstrate the result of this part to your TA.
                    \item The TA should verify the accuracy of your results.
                    \item Have your TA sign the part of your Lab-book corresponding to work you did for this part.
                \end{itemize}
            \end{minipage}
        };
    \end{tikzpicture}\end{center}
}
