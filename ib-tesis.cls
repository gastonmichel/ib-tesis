\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ib-tesis}[2018/10/23 v0.1 IB - UnCuyo]
\LoadClassWithOptions{book}
%------------------Opciones------------------------------------%
\ProcessOptions
%------------------Paquetes------------------------------------%
\RequirePackage[english,spanish]{babel}
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage[a4paper,inner=3cm,outer=2.5cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage[width=0.95\textwidth,textfont=footnotesize,labelfont={bf,small}]{caption}
\RequirePackage{hyperref}
\RequirePackage{color}
\RequirePackage[T1]{fontenc}
\RequirePackage[nonamebreak,sort&compress]{natbib}
\setcitestyle{numbers,square,comma}
\bibliographystyle{ib-tesis}
%------------------Formato-------------------------------------%
\DeclareRobustCommand\es@scroman{\@firstofone}

\def\cleardoublepage{
    \clearpage
    \if@twoside 
        \ifodd\c@page\else
            \hbox{}\thispagestyle{empty}\newpage
            \if@twocolumn\hbox{}\newpage\fi
        \fi
    \fi
}
%------------------Comandos------------------------------------%
\def\carrera#1{\gdef\@carrera{#1}}
\def\titulo#1{\gdef\@titulo{#1}}
\def\autor#1{\gdef\@autor{#1}}
\def\grado#1{\gdef\@grado{#1}}
\def\director#1{\gdef\@director{#1}}
\def\codirector#1{\gdef\@codirector{#1}}
\def\jurado#1{\gdef\@jurado{#1}}
\def\laboratorio#1{\gdef\@laboratorio{#1}}
\def\palabrasclave#1{\gdef\@palabrasclave{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\fecha#1{\gdef\@fecha{#1}}
%------------------\maketitle----------------------------------%
\renewcommand\maketitle{
    \begin{titlepage}
        \begin{singlespace}
            \large
            \begin{center}
                {\Large \MakeUppercase \@carrera\\}
                \vskip 10ex
                \textbf{\MakeUppercase \@titulo\\}
                \vskip 10ex
                \textbf{\@autor\\ \@grado\\}
                \vskip 8ex
                {
                    \begin{tabular}[t]{c}
                        \textbf{\@director}\\ \directorname                    
                    \end{tabular}
                    \ifx\@codirector\undefined{}
                    \else
                    {
                        \hfill
                        \begin{tabular}[t]{c}
                            \textbf{\@codirector}\\ \codirectorname                    
                        \end{tabular}
                    }
                    \fi
                    \\
                }
                \vskip 4ex \vfill
                {\normalsize \textbf{\juradoname}\\ \@jurado\\}
                \vskip 6ex
                \@fecha\\
                \vskip 4ex \vfill
                \@laboratorio
                \vskip 3em
                \balseironame\\
                \uncuyoname\\
                \cneaname\\
                \argentinaname\\
            \end{center}
        \end{singlespace}
    \end{titlepage}
    \global\let\maketitle\relax
    \hypersetup
    {
        pdfborder={0 0 0},
        pdfstartview={FitV},    
        pdfauthor={\@autor},
        pdftitle={\@carrera},
        pdfsubject={\@titulo},
        pdfkeywords={\@palabrasclave},
    }
}
%------------------Ambientes-----------------------------------%
\newcommand\dedicatoria[1]
{
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{10em}%
	\begin{flushright}
		\large
		\begin{tabular}[t]{l}
			#1 
		\end{tabular}
	\end{flushright}
	\cleardoublepage
}
\newenvironment{erratas}{\chapter{\errataname}}{}
\newenvironment{resumen}
{\chapter{\resumenname}}
{
	\vfill
	{\noindent \textbf{\palabrasclavename:} \MakeUppercase \@palabrasclave}
}
\newenvironment{abstract}
{
	\selectlanguage{english}
	\chapter{\abstractname}
	\noindent
    {\bfseries\large\MakeUppercase\@title}
    \par\vspace{1em}
}
{	
	\vfill
	{\bfseries \noindent  \keywordsname: \MakeUppercase \@keywords}
	\selectlanguage{spanish}
}
\newenvironment{publicaciones}{\chapter{\publicacionesname}}{}
\newenvironment{agradecimientos}{\chapter{\agradecimientosname}}{}

%------------------Nombres en Español--------------------------%
\newcommand\errataname{F\'{e} de erratas}
\newcommand\resumenname{Resumen}
\newcommand\abstractname{Abstract}
\newcommand\agradecimientosname{Agradecimientos}
\newcommand\publicacionesname{Publicaciones asociadas}

\newcommand\keywordsname{Keywords}
\newcommand\palabrasclavename{Palabras clave}

\newcommand\directorname{Director}
\newcommand\codirectorname{Co-director}
\newcommand\juradoname{Miembros del Jurado}
\newcommand\balseironame{Instituto Balseiro}
\newcommand\uncuyoname{Universidad Nacional de Cuyo}
\newcommand\cneaname{Comisi\'{o}n Nacional de Energ\'{\i}a At\'{o}mica}
\newcommand\argentinaname{Argentina}

\addto\captionsspanish
{
	\def\contentsname{\'{I}ndice de contenidos}
	\def\listfigurename{\'{I}ndice de figuras}
	\def\listtablename{\'{I}ndice de tablas}
	\def\figurename{Figura}
	\def\tablename{Tabla}
	\def\bibname{Bibliograf\'{\i}a}
	\def\listsymbolname{Glosario de s\'{i}mbolos}
	\def\listacronymname{\'{I}ndice de abreviaturas}
}
\endinput