% Author: Yan-Guo Fu (CoreyFu) 
% Contact: mailto:MA830213@stust.edu.tw / mailto:c12378978@gmail.com
% Version: 0.6

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stust-thesis}[2020/12/16 Thesis template for Southern Taiwan University of Science and Technology]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper, 12pt, oneside]{book}

% Import packages
\RequirePackage{atbegshi}
\RequirePackage{afterpage}
\RequirePackage{background}
\RequirePackage{expl3}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage{listings}
\RequirePackage{rotating}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{stackengine}
\RequirePackage{multirow}
\RequirePackage{xstring}
%% You have to download this packge exclusively to 
%% eg. /usr/share/texlive/texmf-dist/tex/latex/
\RequirePackage{xCJKnumb} 

% Remove headers in book class
%\pagestyle{fancy}
\pagestyle{plain}
%\fancyhf{} % clear all headers and footers
\renewcommand{\headrulewidth}{0pt} % remove rule between header and text

% Configure depths of sections
\setcounter{secnumdepth}{3}
% Adjust linespacing to singlespacing
\linespread{1.5} 

% Prevent empty page shows before title page
%\AtBeginDocument{\AtBeginShipoutNext{\AtBeginShipoutDiscard}}

% Layouts
\geometry{%
    top=2.5cm,
    left=3.5cm,
    right=2.5cm,
    bottom=2.75cm
}

% Watermark
\newcommand{\activateBG}{%
    \backgroundsetup{%
        scale=0.75,
        angle=0,
        position=current page.south,
        nodeanchor=south west,
        hshift=2in,
        contents=\includegraphics{logo/STUST_LOGO.jpg}
    }
}
\newcommand{\deactivateBG}{%
    \backgroundsetup{%
        scale=0.75,
        angle=0,
        position=current page.south,
        nodeanchor=south west,
        hshift=2in,
        contents={}
    }
}

% Declarations
\DeclareRobustCommand{\university}[2]{\gdef\universityENG{#1}\gdef\universityCHT{#2}}
\DeclareRobustCommand{\college}[2]{\gdef\collegeENG{#1}\gdef\collegeCHT{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\instituteENG{#1}\gdef\instituteCHT{#2}}
\DeclareRobustCommand{\degree}[2]{\gdef\degreeENG{#1}\gdef\degreeCHT{#2}}
\DeclareRobustCommand{\title}[2]{\gdef\titleENG{#1}\gdef\titleCHT{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\authorENG{#1}\gdef\authorCHT{#2}}
\DeclareRobustCommand{\stuID}[1]{\gdef\stuIDENG{#1}}
\DeclareRobustCommand{\advisor}[2]{\gdef\advisorENG{#1}\gdef\advisorCHT{#2}}
\DeclareRobustCommand{\director}[2]{\gdef\directorENG{#1}\gdef\directorCHT{#2}}
\DeclareRobustCommand{\day}[2]{\gdef\dayENG{#1}\gdef\dayCHT{#2}}
\DeclareRobustCommand{\month}[2]{\gdef\monthENG{#1}\gdef\monthCHT{#2}}
\DeclareRobustCommand{\year}[2]{\gdef\yearENG{#1}\gdef\yearCHT{#2}}

% Renaming
\renewcommand\figurename{圖}
\renewcommand\tablename{表}
\renewcommand\contentsname{目錄}
\renewcommand\listfigurename{圖目錄}
\renewcommand\listtablename{表目錄}
\renewcommand\lstlistlistingname{程式碼一覽}
\renewcommand\lstlistingname{程式碼}
%% refname for article class
%% bibname for report/book class
\renewcommand\bibname{參考文獻} 
%% Configure Chapters' format in TOC
\titleformat{\chapter}{\centering\Huge\bfseries}{第\thinspace \xCJKnumber{\thechapter}\thinspace 章}{1em} {}
\titlecontents{chapter}% <section>
[0em]% <left>
{}% <above-code>
{\bfseries 第\xCJKnumber{\thecontentslabel}章\enspace\thinspace\thinspace}% <numbered-entry-format>
{\bfseries}% <numberless-entry-format>
{\titlerule*[.7pc]{}\contentspage}% <filter-page-format>

% Reduce vertical spaces of chapters' title
\titlespacing*{\chapter}{0pt}{-40pt}{40pt} % above and bottom

% Declare customize environments
\newenvironment{abstract}[1]%
{%
    \addtocounter{page}{1}
    \normalexpandarg% Ensure args to be passed to \IfStrEq
    \IfStrEq{#1}{cht}{%
    \chapter*{摘要}
    \addcontentsline{toc}{chapter}{摘要}
    }{%
    \chapter*{Abstract}%
    \addcontentsline{toc}{chapter}{Abstract}%
    }
}% before
{\clearpage}% after
\DeclareRobustCommand{\keywords}[2][1]{%
    \normalexpandarg% Ensure args to be passed to \IfStrEq
    \IfStrEq{#1}{cht}{%
    \vspace*{1cm}
    \noindent\textbf{關鍵詞：}{#2}
    }{%
    \vspace*{1cm}
    \noindent\textbf{Keywords: }{#2}
    }
}
\newenvironment{ack}[1]% Add chapter Acknowlegements to TOC
{
    \normalexpandarg% Ensure args to be passed to \IfStrEq
    \IfStrEq{#1}{cht}{%
    \chapter*{致謝}
    \addcontentsline{toc}{chapter}{致謝}
    }{%
    \chapter*{Acknowledgements}
    \addcontentsline{toc}{chapter}{Acknowledgements}
    }
}% before
{}% after
\newenvironment{symbols}[1]% Add chapter Symbols to TOC
{
    \normalexpandarg% Ensure args to be passed to \IfStrEq
    \IfStrEq{#1}{cht}{%
    \chapter*{符號彙編}
    \addcontentsline{toc}{chapter}{符號彙編}
    \tabularx{1.0\textwidth}{C{0.8}L{1.2}}
        \fontsize{18}{0}\textbf{符號} & \fontsize{18}{0}\textbf{意義} \\
    }{%
    \chapter*{Symbols}
    \addcontentsline{toc}{chapter}{Symbols}
    \tabularx{1.0\textwidth}{C{0.8}L{1.2}}
        \fontsize{18}{0}\textbf{Symbols} & \fontsize{18}{0}\textbf{Meanings} \\
    }
}% before
{\endtabularx}% after
\renewenvironment{appendix}[1]% Appendices
{%
    \setcounter{section}{0}
    \renewcommand\thesection{\Alph{section}}
    \normalexpandarg% Ensure args to be passed to \IfStrEq
    \IfStrEq{#1}{cht}{%
    \chapter*{附錄}
    \addcontentsline{toc}{chapter}{附錄一覽}
    }{%
    \chapter*{Appendix}
    \addcontentsline{toc}{chapter}{Appendices}
    }
}% before
{}% after
%%% ----------空白頁------------- %%%
\newcommand\emptypage{%
    \null\thispagestyle{empty}
%    \addtocounter{page}{-1}
    \newpage
} % Rreference: https://reurl.cc/4mKYZX 
%%% ----------------------------- %%%

% Cover Page
\DeclareRobustCommand{\makecover}{%
\begin{titlepage}
    \begin{center}
        \vspace*{0cm}
        \fontsize{36}{40}\selectfont \textbf{\universityCHT}\\
        \vspace{.3\baselineskip}
        \Huge 
        \textbf{\instituteCHT}\textbf{\degreeCHT}\textbf{班}\\
        \vspace{-.3cm}
        \textbf{\degreeCHT}\textbf{學位論文}\\
        \vspace{1.2\baselineskip}
        \textbf{\titleCHT}\\
        \LARGE \textbf{\titleENG}
        \vfill
        \LARGE
        \textbf{研 \thinspace 究 \thinspace 生} ：\textbf{\authorCHT}\\
        \vspace{\baselineskip}
        \textbf{指導教授} ：\textbf{\advisorCHT}
        \vfill
        \textbf{中華民國}\textbf{\protect\yearCHT}\textbf{年}\textbf{\protect\monthCHT}\textbf{月}
    \end{center}
\end{titlepage}
}
% Title Page
\DeclareRobustCommand{\maketitle}{%
\begin{titlepage}
    \begin{center}
        \vspace*{0cm}
        \fontsize{36}{40}\selectfont \textbf{\universityCHT}\\
        \vspace{.3\baselineskip}
        \Huge 
        \textbf{\instituteCHT}\textbf{\degreeCHT}\textbf{班}\\
        \vspace{-.3cm}
        \textbf{\degreeCHT}\textbf{學位論文}\\
        \vspace{1.2\baselineskip}
        \textbf{\titleCHT}\\
        \LARGE \textbf{\titleENG}
        \vfill
        \LARGE
        \makebox[.2\textwidth][s]{\textbf{\authorCHT}}\\
        \vspace{\baselineskip}
        \textbf{指導教授} ：\textbf{\advisorCHT}
        \vfill
        \textbf{中華民國}\textbf{\protect\yearCHT}\textbf{年}\textbf{\protect\monthCHT}\textbf{月}
    \end{center}
\end{titlepage}
}
