\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2019/07/25 - Memo Class Tight Header and Logo]

% Load the Base Class
\LoadClassWithOptions{scrartcl}

% Required packages
\RequirePackage{ifthen}
\RequirePackage{geometry}
\geometry{margin=1.0in}
\RequirePackage{graphicx}

% Memo Commands
\def\@memoto{\relax}
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}

\def\@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}

\def\@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}

\def\@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}

\def\@memologo{\relax}
\newcommand{\memologo}[1]{\gdef\@memologo{\protect #1}}

% Decorative line
\newcommand\decorativeline[1][1pt]{%
  \par\noindent\rule[0.5ex]{\linewidth}{#1}\par
}

% Adjusted Memo Title and Logo positioned at top margin
\renewcommand{\maketitle}{
    \thispagestyle{empty} % no page number on the first page
    \vspace*{-1.2cm} % moves entire header upwards significantly
    \noindent
    \begin{minipage}[t]{0.7\textwidth}
        {\ttfamily
        \begin{tabular}{@{}ll@{}}
          \ifthenelse{\equal{\@memofrom}{\relax}}{}{From: & \@memofrom \\[2pt]}
          \ifthenelse{\equal{\@memosubject}{\relax}}{}{Subject: & \@memosubject \\[2pt]}
          \ifthenelse{\equal{\@memodate}{\relax}}{}{Date: & \@memodate \\[2pt]}
        \end{tabular}}
    \end{minipage}
    \begin{minipage}[t]{0.3\textwidth}
        \vspace{-0.9cm} % moves logo down 
        \raggedleft
        \ifthenelse{\equal{\@memologo}{\relax}}{}{%
            \resizebox{0.55\linewidth}{!}{\@memologo}
        }
    \end{minipage}
    \vspace{-0.6cm}\decorativeline\smallskip{}
}

% Paragraph style (unchanged)
\KOMAoptions{parskip=half}
\usepackage[T1]{fontenc}
\addtokomafont{disposition}{\rmfamily}
\addtokomafont{descriptionlabel}{\rmfamily}
\renewcommand\labelitemii{$\circ$}
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% Sign-off block: signature (if assets/.signature.png or .pdf exists; kept out of git and the site), name in mono, title lines.
% Use in a memo's front matter:  include-after: \memosignoff{DENTEN}{Director}
\newcommand{\memosignoff}[2]{%
  \par\bigskip\noindent
  \begin{minipage}[t]{0.5\textwidth}
    \IfFileExists{assets/.signature.pdf}{\includegraphics[height=1.4cm]{assets/.signature.pdf}\\}{%
    \IfFileExists{assets/.signature.png}{\includegraphics[height=1.4cm]{assets/.signature.png}\\}{\rule{0pt}{1.4cm}\\}}%
    {\ttfamily #1}\\
    {\small #2, Narrative Intelligence Lab\\
    Columbia University}
  \end{minipage}\par
}
