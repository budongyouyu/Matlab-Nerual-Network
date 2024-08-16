% This template aims to simplify and improve the (Xe)LaTeX template provided
% by the TU Delft. Original template by TU Delft. Rewritten template by Daan
% Zwaneveld (https://dzwaneveld.github.io)
%
% This template by Daan Zwaneveld is licensed under CC BY-NC 4.0. To view a
% copy of this license, visit https://creativecommons.org/licenses/by-nc/4.0/.
% No attribution is required in PDF outputs created using this template.

%% ----------------------------------------------------------------------
%%    Setting up the class, main packages and basic definitions
%% ----------------------------------------------------------------------

%% Class is based on the default book class and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudelft-report}[23-07-2022 v1.6 TU Delft Report Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[10pt,oneside]{book}


%% Main packages in the document --- Some are imported later in the class file
\RequirePackage{mathtools}  % Mathematical tools to use with amsmath
\RequirePackage{amssymb}    % Extended symbol collection
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{siunitx}    % Comprehensive (SI) units package
\RequirePackage{framed}
\RequirePackage[bottom]{footmisc}
\RequirePackage{pgfplots}

\RequirePackage{tabularx}   % Tabulars with adjustable-width columns
\RequirePackage{booktabs}   % Publication quality tables
\RequirePackage{longtable}  % Allow tables to flow over page boundaries
\RequirePackage{multirow}   % Create tabular cells spanning multiple rows

\RequirePackage{extarrows}

\RequirePackage{arydshln}

\RequirePackage{ctex}       %chinese font

\RequirePackage{graphicx}   % Enhanced support for images
\RequirePackage{float}      % Improved interface for floating objects
\RequirePackage[labelfont=bf,justification=centering,footnotesize]{caption} % Captions
\RequirePackage{subcaption} % Support for sub-captions
\RequirePackage{pdfpages}   % Include PDF documents

\RequirePackage[pdfusetitle,hidelinks]{hyperref} % Extensive support for hypertext
\RequirePackage[noabbrev]{cleveref} % Intelligent cross-referencing
\RequirePackage{xcolor}     % Driver-independent color extensions
\RequirePackage{tikz}       % Create PostScript and PDF graphics
\RequirePackage{xspace}     % Define commands that appear not to eat spaces
\RequirePackage{microtype}  % Refinements towards typographical perfection

\RequirePackage{geometry}   % Customize document dimensions
\RequirePackage{titlesec}   % Select alternative section titles
\RequirePackage{titletoc}   % Alternative headings for toc
\RequirePackage{fancyhdr}   % Control of page headers and footers
\RequirePackage{enumitem}   % Control layout of itemize, enumerate, description
\RequirePackage{etoolbox}   % Toolbox of programming facilities
\RequirePackage{iftex}      % Adds if-else statements to support multiple compilers
\RequirePackage{datetime}   % Change format of \today
\RequirePackage{forest}
\RequirePackage{mdframed}

% 绘制贝叶斯网络
\usetikzlibrary{bayesnet}

%树状图设置forest
\usetikzlibrary{decorations.pathreplacing}

\forestset{
  forest scheme/.style={
    for tree={
      inner sep=0pt,
      outer sep=0pt,
      fit=band,
      child anchor=west,
      parent anchor=east,
      grow'=0,
      anchor=west,
      align=left,
      if n=1{
        edge path'={(!u1.west) -- (!ul.west);}
      }{no edge},
      edge={decorate, decoration={brace,amplitude=1.5mm,mirror,raise=2mm}},
    },
  }
}

%设置minitoc在每个小章节中生成的小目录格式

%% Establish commands for the subtitle, subject, affiliation, cover image and table of authors
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\subject}[1]{\def\@subject{#1}}
\newcommand*{\affiliation}[1]{\def\@affiliation{#1}}
\newcommand*{\coverimage}[1]{\def\@coverimage{#1}}
\newcommand*{\covertable}[1]{\def\@covertable{#1}}


\usetikzlibrary{3d}

%% Scale the margins to be slightly smaller than default (.7)
\geometry{a4paper,hscale=0.75,vscale=0.8}

%% ----------------------------------------------------------------------
%%    Setting up the fonts
%% ----------------------------------------------------------------------

\ifPDFTeX
    %% With pdfLaTeX, use Paletino as the main font and Roboto Slab as title fonts
    \RequirePackage[T1]{fontenc}  % Select T1 font encoding
    \RequirePackage{newpxtext}    % Palatino-like font...
    \RequirePackage{newpxmath}    % ...with support for mathematics
    \RequirePackage{xeCJK} 

    \newcommand{\titlestyle}{\fontfamily{RobotoSlab-TLF}\fontseries{light}\selectfont}
    \newcommand{\largetitlestyle}{\fontfamily{RobotoSlab-TLF}\fontseries{thin}\selectfont}
\else
    %% If XeLaTeX or LuaLaTeX is set as the compiler, the TU Delft house style fonts are used (see https://www.tudelft.nl/huisstijl/bouwstenen/typografie).
    \RequirePackage{fontspec} % Advanced font selection

    %% Use Arial as the main font and Roboto Slab as title fonts
    \setmainfont{Times New Roman}
    \setmathsf{Times New Roman}
    \setmathtt{Times New Roman}

    \definecolor{MSBlue}{rgb}{.204,.353,.541}
    \definecolor{MSLightBlue}{rgb}{.31,.506,.741}

    \newfontfamily\titlestyle{Baskerville}
   % \newfontfamily\largetitlestyle{Roboto Slab}
   \newfontfamily\largetitlestyle{Baskerville}
\fi

%% ----------------------------------------------------------------------
%%    Formatting the titles and table of contents
%% ----------------------------------------------------------------------

%% Format the chapter titles and spacing
\titleformat{\chapter}[display]
    {\flushright\color{MSBlue}}
    {\fontsize{48}{48}\selectfont\largetitlestyle Chapter  \fontsize{96}{96}\selectfont\largetitlestyle\thechapter}
    {0pt}
    {\Huge\titlestyle}
\titlespacing*{\chapter}{0pt}{0pt}{2\baselineskip}

%% Format the section titles and spacing
\titleformat{\section}
    {\Large\titlestyle\bfseries\color{MSBlue}}%\centering
    {\thesection.}
    {5pt}
    {}[\vspace{0.6em}]
\titlespacing*{\section}{0pt}{\baselineskip}{0pt}

%% Format the subsections titles and spacing
\titleformat{\subsection}
    {\large\titlestyle\bfseries\color{MSBlue}}
    {\thesubsection.}
    {5pt}
    {\hspace{2em}}[\vspace{0.4em}]
\titlespacing*{\subsection}{0pt}{\baselineskip}{0pt}

%% Format the subsubsections titles and spacing
\titleformat{\subsubsection}
    {\titlestyle\bfseries\color{MSBlue}}
    {}
    {1pt}
    {\hspace{2em}}[\vspace{0.5em}]
\titlespacing*{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Reduce the vertical white space between chapters in the table of contents
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\bfseries}{1.5em}{0pt}

%% ----------------------------------------------------------------------
%%    Formatting the header and footer
%% ----------------------------------------------------------------------

%% Format the header and footer of 'plain' pages
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\titlestyle\thepage}}

%% Format the header and footer of 'fancy' pages (based on twoside option)
\if@twoside
    \fancyhf{}
    \fancyhead[LE,RO]{\titlestyle\thepage}
    \fancyhead[RE]{\titlestyle\nouppercase{\leftmark}}
    \fancyhead[LO]{\titlestyle\nouppercase{\rightmark}}
    \RequirePackage{emptypage} % Remove header and footer on empty pages
\else
    \fancyhf{}
    \fancyhead[R]{\titlestyle\thepage}
    \fancyhead[L]{\titlestyle\nouppercase{\rightmark}}
\fi

\pagestyle{fancy} % Set the package defaults and the additional changes as the style

%% ----------------------------------------------------------------------
%%    Setting up the \makecover command for the cover page
%% ----------------------------------------------------------------------

\newcommand*{\makecover}{
    %% Use the Tikz library positioning and clear the page header and footer
    \usetikzlibrary{positioning}
    \thispagestyle{empty}

    %% Construct the cover page with Tikz
    \begin{tikzpicture}[overlay,remember picture]

        %% Add the cover image
        \node[above=0,inner sep=0] at (current page.south) {%
            \includegraphics[width=\paperwidth]{\@coverimage}};

        %% Add the affiliation on the left
        \node[rotate=90,below right=40mm and 3mm] at (current page.west) {%
            \ifdefvoid{\@affiliation}{}{\color{white}\titlestyle\@affiliation}};

        %% Add the logo in the bottom left
        \node[above right=10mm] at (current page.south west) {%
            \includegraphics[width=0.35\linewidth]{figures/logo-white.pdf}};

        %% Add the banner with the title, subtitle, subject and author(s)
        \node[below=2cm,fill=black!85,minimum width={\paperwidth},inner ysep=25pt,opacity=0.6,text opacity=1] at (current page.north) {%
            \begin{minipage}{0.9\paperwidth}
                %% Format and add the title
                \color{title}\raggedright\largetitlestyle\fontsize{50}{50}\selectfont%
                    \@title \\[0.5ex]
                %% Format and add (optional) subtitle and subject
                \color{white}\titlestyle\fontsize{22}{22}\selectfont%
                    \ifdefvoid{\@subtitle}{}{\@subtitle \\[2.5ex]}%
                    \ifdefvoid{\@subject}{}{\@subject \\[0.5ex]}
                %% Format and add author or table of authors
                \largetitlestyle\fontsize{24}{24}\selectfont%
                    \ifdefvoid{\@covertable}{\@author}{\@covertable}
            \end{minipage}};

    \end{tikzpicture}
    \newpage
}

%% ----------------------------------------------------------------------
%%    Setting up listings
%% ----------------------------------------------------------------------

\RequirePackage{listings} % Typeset source code listings

\lstset{
  basicstyle=\ttfamily\footnotesize,  % Style of the font that is used for the code
  backgroundcolor=\color{gray!10},    % Background color
  keywordstyle=\color{red!75!black},  % Keyword style
  stringstyle=\color{green!40!black}, % String style
  commentstyle=\color{blue!30!black}, % Comment style
  numbers=left,                       % Add line numbers on the left side
  numbersep=5pt,                      % Decrease distance between line numbers and code
  numberstyle=\tiny,                  % Line number style
  breaklines=true,                    % Line break automatically
}

%----------------------------------------------------------------------
%%    Setting up listings
%% ----------------------------------------------------------------------

\RequirePackage{listings} % Typeset source code listings

\lstset{
  basicstyle=\ttfamily\footnotesize,  % Style of the font that is used for the code
  backgroundcolor=\color{gray!10},    % Background color
  keywordstyle=\color{red!75!black},  % Keyword style
  stringstyle=\color{green!40!black}, % String style
  commentstyle=\color{blue!30!black}, % Comment style
  numbers=left,                       % Add line numbers on the left side
  numbersep=5pt,                      % Decrease distance between line numbers and code
  numberstyle=\tiny,                  % Line number style
  breaklines=true,                    % Line break automatically
}

\newenvironment{keyword}{
	\begin{quote}\itshape
        \textbf{Keyword: }
}%开始部分定义
{\end{quote}}%结束部分定义

\newenvironment{abs}{
	\begin{quote}\itshape\noindent
}%开始部分定义
{\end{quote}}%结束部分定义

%definition env
\newtheoremstyle{axiom}% name
{3pt}% Space above
{3pt}% Space below
{\itshape}% Body font
{}% Indent amount
{\bf}% Theorem head font
{:}% Punctuation after theorem head
{.5em}% Space after theorem head
{}% Theorem head spec (can be left empty, meaning ‘normal’ )
\theoremstyle{axiom}

\newtheoremstyle{corollary}% name
{3pt}% Space above
{3pt}% Space below
{\itshape}% Body font
{}% Indent amount
{\bf}% Theorem head font
{:}% Punctuation after theorem head
{.5em}% Space after theorem head
{}% Theorem head spec (can be left empty, meaning ‘normal’ )
\theoremstyle{corollary}

\newtheoremstyle{theorem}% name
{3pt}% Space above
{3pt}% Space below
{\itshape}% Body font
{}% Indent amount
{\bf}% Theorem head font
{:}% Punctuation after theorem head
{.5em}% Space after theorem head
{}% Theorem head spec (can be left empty, meaning ‘normal’ )
\theoremstyle{theorem}

\newtheoremstyle{pf}% name
{3pt}% Space above
{3pt}% Space below
{\itshape}% Body font
{}% Indent amount
{\bf}% Theorem head font
{:}% Punctuation after theorem head
{.5em}% Space after theorem head
{}% Theorem head spec (can be left empty, meaning ‘normal’ )
\theoremstyle{pf}

\newtheoremstyle{example}% name
{3pt}% Space above
{3pt}% Space below
{\itshape}% Body font
{}% Indent amount
{\bf}% Theorem head font
{:}% Punctuation after theorem head
{.5em}% Space after theorem head
{}% Theorem head spec (can be left empty, meaning ‘normal’ )
\theoremstyle{example}

\newtheorem{theorem}{\indent theorem}[section]
\newtheorem{question}{\indent Question}[]
\newtheorem{lemma}[theorem]{\indent lemma}
\newtheorem*{pf}{\indent \emph{proof}}
\newtheorem{axiom}[theorem]{\indent axiom}
\newtheorem{proposition}[theorem]{\indent proposition}
\newtheorem{corollary}[theorem]{\indent corollary}
\newtheorem{define}{\indent definition}[section]
\newtheorem{example}{\indent example}[section]
\newtheorem{remark}{\indent remark}[section]

\newenvironment{solution}{\begin{proof}[\indent\bf solution]}{\end{proof}}
%\renewcommand{\proofname}{\indent\bf proof}
\renewcommand{\proof}{\indent \textbf{\emph{proof}}. \par}
\newenvironment{note}{\begin{proof}[\indent\bf note]}{\end{proof}}
\newenvironment{analysis}{\begin{proof}[\indent\bf analysis]}{\end{proof}}

\renewcommand{\footnoterule}{\vspace*{0.9cm}\noindent\rule{2.5cm}{0.4pt}\vspace*{0.3cm}} 