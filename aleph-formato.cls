%%
%% This is file `aleph-formato.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% aleph-formato.dtx  (with options: `aleph-formato')
%% 
%% This is a generated file.
%% LaTeX class for typesetting notes
%% 
%% Copyright (C) 2023 Daniel Lara <naranjolm99@gmail.com>
%% 
%% Para un mejor uso y entendimiento de la actual clase,
%% consultar la documentación.
%% 

\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{aleph-formato}[2023/12/27 v2.0]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Inicialización
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Primero definimos una serie de comandos auxiliares para las opciones
\newcommand\@idioma{spanish,es-noitemize}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Opciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Opciones de tamaño de letra.
\DeclareOption{9pt}{\PassOptionsToClass{9pt}{article}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
%%  Opciones predeterminadas de tamaño de página |compacto| y |amplio|.
\DeclareOption{amplio}{
    \PassOptionsToPackage{paperwidth=195mm,paperheight=265mm,twoside,
    inner=2.2cm,outer=2.2cm,top=2.25cm,bottom=2.25cm}{geometry}}
\DeclareOption{compacto}{
    \PassOptionsToPackage{paperwidth=160mm,paperheight=240mm,twoside,
    inner=1.7cm,outer=1.7cm,top=2.25cm,bottom=2.25cm}{geometry}}
\DeclareOption{A4}{
    \PassOptionsToPackage{paperwidth=210mm,paperheight=297mm,twoside,
    inner=2.2cm,outer=2.2cm,top=2.25cm,bottom=2.25cm}{geometry}}
\DeclareOption{A4-s}{
    \PassOptionsToPackage{paperwidth=210mm,paperheight=297mm,twoside,
    inner=1cm,outer=1cm,top=1cm,bottom=1.8cm}{geometry}}
\DeclareOption{A5}{
    \PassOptionsToPackage{paperwidth=148mm,paperheight=210mm,twoside,
    inner=1.7cm,outer=1.7cm,top=2.25cm,bottom=2.25cm}{geometry}}
%%  Opciones predeterminadas son |A4| y |10pt|.
\ExecuteOptions{A4,10pt}
\ProcessOptions\relax
\LoadClass{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Paquetes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Son necesarios los siguientes paquetes para dar formato al documento.
\RequirePackage{iftex}
\ifPDFTeX % LaTeX y pdfLaTeX
    \RequirePackage[utf8]{inputenc}
\else % XeLaTeX
\fi
\RequirePackage[T1]{fontenc}
\RequirePackage[\@idioma]{babel}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage{lipsum}
\RequirePackage{amsmath,amsthm}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{comment}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{xparse}
\RequirePackage{enumitem}
\RequirePackage{tabularray}
\RequirePackage[many]{tcolorbox}
\RequirePackage[font={small},labelfont={bf,small},
   justification=centerlast]{caption}
\RequirePackage{geometry}
\RequirePackage[colorlinks,allcolors=.,breaklinks]{hyperref}
\RequirePackage{lastpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ---> Opción de puntuación
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% El siguiente comando define las opciones de tipografía a utilizar de acuerdo al tipo de compilador
\newcommand{\fuente}[1]{
    \ifthenelse{\equal{#1}{mathpazo}}
    {
        \ifPDFTeX % LaTeX y pdfLaTeX
            \RequirePackage{mathpazo}
        \else % XeLaTeX
            \RequirePackage{fontspec}
            \RequirePackage{mathpazo}
            \setmainfont
             [ BoldFont       = texgyrepagella-bold.otf ,
               ItalicFont     = texgyrepagella-italic.otf ,
               BoldItalicFont = texgyrepagella-bolditalic.otf ]
             {texgyrepagella-regular.otf}
            % \RequirePackage{newpxtext,newpxmath}
        \fi
    }{}
    \ifthenelse{\equal{#1}{montserrat}}
    {
        \ifPDFTeX % LaTeX y pdfLaTeX
            \RequirePackage[defaultfam,tabular,lining]{montserrat}
                \renewcommand*\oldstylenums[1]{{\fontfamily{Montserrat-TOsF}\selectfont #1}}
            \RequirePackage[OT1]{eulervm}
            \renewcommand{\labelitemi}{$\bullet$}
            \DeclareMathSizes{10}{10.78}{7}{7}
        \else % XeLaTeX
            \RequirePackage[OT1]{eulervm}
            \RequirePackage{fontspec}
            \setmainfont{montserrat}
            \DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{m}{n}
            \DeclareMathSizes{10}{10.78}{7}{7}
        \fi
    }{}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Variables internas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  La siguiente es la lista de las variables internas utilizadas para el formato.
\newcommand\@institucion{Escuela Politécnica Nacional}
\newcommand\@temacorto{}
\newcommand\@interlineado{1.2}
\newcommand\@longtitulo{0.75\linewidth}
\newcommand\@espteo{-0.75ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Colores predeterminados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Los siguientes son los colores predefinidos de la clase.
\definecolor{colordef}{cmyk}{0,0,0,1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Espaciado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Para mejorar la medida entre las ecuaciones.
\AtBeginDocument{
   \addtolength{\abovedisplayskip}{-0.5mm}
   \addtolength{\belowdisplayskip}{-0.5mm}
    }
%%  Interlineado
\newcommand{\interlineado}[1]{\renewcommand\@interlineado{#1}}
%%  Espacio para recuadro de teoremas
\newcommand{\espteo}[1]{\renewcommand\@espteo{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Definición de comandos de datos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Institución
\newcommand{\institucion}[1]%
    {\renewcommand\@institucion{#1}}
%%  Autor
\newcommand{\autor}[1]%
    {\newcommand\@autor{#1}}
%%  Materia
\newcommand{\materia}[1]%
    {\newcommand\@materia{#1}}
%%  Codigo materia
\newcommand{\codigomateria}[1]%
    {\newcommand\@codigomateria{#1}}
%%  Semestre
\newcommand{\semestre}[1]%
    {\newcommand\@semestre{#1}}
%%  Fecha
\newcommand{\fecha}[1]%
    {\newcommand\@fecha{#1}}
%%  Tema
\newcommand{\tema}[1]%
    {\newcommand\@tema{#1}}
%%  Subtema
\newcommand{\subtema}[1]%
    {\newcommand\@subtema{#1}}
%% Encabezado
\newcommand{\encabezado}{
    \vspace{-25mm}
    \begin{center}
\hrule
\vspace{8pt}
\textbf{ \textsc { \large \@institucion}}
    \end{center}
    \textbf{Nombre:} \@autor \hspace{\fill} \textbf{Fecha:} \@fecha \newline
    \textbf{Tema:} \@tema \hspace{\fill}  \textbf{Materia:} \@materia \hspace{3pt}- \@codigomateria
    \vspace{8pt}
    \hrule
    \begin{center}\small
    \textbf{\textsc{\@subtema}}
    \end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Varios
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Ambiente para esquema de soluciones
\newenvironment{esquema}%
{\begin{proof}[Esquema]}%
{\end{proof}}
%%  Comando para indicar puntos pendientes de revisión
\newcommand{\pendiente}{\textcolor{red}{\textit{(pendiente)}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Interlineado
\renewcommand{\baselinestretch}{\@interlineado}
%%  Encabezado y pie de página
\fancyfoot[C]{Página \thepage\ de \pageref{LastPage}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo teoremas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Keys temporales: |tipo|,|color|, |contador| e |icóno|.
\def\tcb@@tipo{}
    \tcbset{ tipo/.code = {\def\tcb@@tipo{#1} } }
\def\tcb@@contador{}
    \tcbset{ contador/.code = {\def\tcb@@contador{#1} } }
\def\tcb@@color{colordef}
    \tcbset{ color/.code = {\def\tcb@@color{#1} } }
\def\tcb@@icono{{\large\faWarning}}
    \tcbset{ icono/.code = {\def\tcb@@icono{#1} } }
%%  Estilo de teorema.
\newtheoremstyle{estiloteorema}%
    {9pt}{9pt}{}{0pt}
    {\bfseries\sffamily\color{\tcb@@color}}
    {}{ }
    {\textsc{\thmname{#1}\thmnumber{ #2}}\thmnote{: #3}.}
%%  Formatos del estilo
%%
%%  Recuadro sin título aparte
\tcbset{ recuadrost/.style ={
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=white,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    % parbox=false
    }
    }
%%  Estilo de post-it
\tcbset{ postit/.style ={
    % -> Opciones generales
    breakable,enhanced,
    before skip=2mm,after skip=3mm,
    colback=\tcb@@color!50,colframe=\tcb@@color!20!black,
    boxrule=0.4pt,
    drop fuzzy shadow,
    left=6mm,right=2mm,top=0.5mm,bottom=0.5mm,
    sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
    % parbox=false,
    underlay unbroken and last = {%
        \path[fill=tcbcolback!80!black]
        ([yshift=3mm]interior.south east) --++ (-0.4,-0.1) --++ (0.1,-0.2);
        \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm]
        ([yshift=3mm]interior.south east) --++ (-0.4,-0.1) --++ (0.1,-0.2);
        \path[fill=\tcb@@color!50!black,draw=none]
        (interior.south west) rectangle node[white]{\tcb@@icono} ([xshift=5.5mm]interior.north west);
        },
    underlay = {%
        \path[fill=\tcb@@color!50!black,draw=none]
        (interior.south west) rectangle node[white]{\tcb@@icono} ([xshift=5.5mm]interior.north west);
        }
    }
    }
%%  Recuadro con título aparte interno
\tcbset{ recuadroctint/.style ={
    % -> Opciones generales
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=white,colframe=colordef!7,colbacktitle=white,
    boxrule=0pt,toprule=0.4pt,
    drop fuzzy shadow,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    % parbox=false,
    % Dibujo del título
    overlay unbroken and first = {
        % Borde superior grueso
        \draw[\tcb@@color,line width =2.5cm]
            ([xshift=1.25cm, yshift=0cm]frame.north west)--+(0pt,3pt);
        },
    overlay middle and last = { },
    title={
            \color{\tcb@@color}\bfseries\sffamily
            {\scshape\tcb@@tipo~\arabic{\tcb@@contador}}%
                %
            \ifthenelse{\equal{#1}{}}{.}{: #1.}%
        },
    }
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Definición de ambientes de teoremas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Ambientes sin recuadro: |ejem| y |obs|
\theoremstyle{estiloteorema}
    \newtheorem{ejem}{Ejemplo}
    \newtheorem*{obs}{\tikz \fill[colordef] (1ex,1ex) circle (.8ex); Observaci\'on}
%%  Ambientes con recuadrost: |prop|, |cor|, |lem|, |ejer|.
    \newtheorem{prop}{Proposici\'on}
        \tcolorboxenvironment{prop}{%
            color=colordef,recuadrost,drop fuzzy shadow
        }
    \newtheorem{cor}[prop]{Corolario}
        \tcolorboxenvironment{cor}{%
            color=colordef,recuadrost,drop fuzzy shadow
        }
    \newtheorem{lem}[prop]{Lema}
        \tcolorboxenvironment{lem}{%
            color=colordef,recuadrost,drop fuzzy shadow
        }
    \newtheorem{ejer}{Ejercicio}
        \tcolorboxenvironment{ejer}{%
            color=colordef,recuadrost,drop fuzzy shadow
        }
%%  Ambientes con título aparte: |teo|.
\newtcolorbox{teo}[1][]
    {tipo=Teorema,contador=prop,color=colordef,recuadroctint={#1}}
%%  Ambientes con título aparte: |defi|.
\newcounter{defi}
\renewcommand{\thedefi}{\arabic{defi}}
\newtcolorbox{defi}[1][]
    {tipo=Definici\'on,contador=defi,color=colordef,recuadroctint={#1}}
%%  Ambientes con título aparte: |axioma|.
\newcounter{axioma}
\renewcommand{\theaxioma}{\arabic{axioma}}
\newtcolorbox{axioma}[1][]
    {tipo=Axioma,contador=axioma,color=colordef,recuadroctint={#1}}
%%  Ambientes advertencia: |advertencia|.
\newtcolorbox{advertencia}
    {color=yellow,postit}
%% Y ¡se acabó!
\endinput
%%
%% End of file `aleph-formato.cls'.
