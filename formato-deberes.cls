\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{formato-deberes}[2020/02/11 v1.1]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Inicialización
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Primero definimos una serie de comandos auxiliares para las opciones
\newcommand\@idioma{spanish,es-noitemize}
\newcommand\@tipo{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Opciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Opciones de tamaño de letra.
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
\DeclareOption{9pt}{\PassOptionsToClass{9pt}{article}}
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
%%  Opción de formato |guia| o |resumen|.
\DeclareOption{guia}{\renewcommand\@tipo{guia}}
\DeclareOption{resumen}{\renewcommand\@tipo{resumen}}
%%  Opciones predeterminadas son |compacto|, |guia| y |10pt|.
\ExecuteOptions{A4,guia,10pt}
\ProcessOptions\relax
\LoadClass{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Paquetes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Son necesarios los siguientes paquetes para dar formato al documento.
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[\@idioma]{babel}
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{fontawesome}
\RequirePackage{etex}
\RequirePackage{xcolor}
\RequirePackage{lipsum}
\RequirePackage{mathpazo}
\RequirePackage{amsmath,amsthm}
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{mathpazo}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{comment}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{xparse}
\usepackage{enumitem}
\RequirePackage[many]{tcolorbox}
\RequirePackage[font={small},labelfont={bf,small},
   justification=centerlast]{caption}
\RequirePackage{geometry}
\RequirePackage[colorlinks,linkcolor=black,urlcolor=black,
   citecolor=black,bookmarks=true]{hyperref}
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ---> Opción de puntuación
%%%%%%%%%%%%%%%%%%%%%%%%%%
\spanishdecimal{.}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Variables internas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  La siguiente es la lista de las variables internas utilizadas para el formato.
\newcommand\@universidad{Escuela Politécnica Nacional}
\newcommand\@longtitulo{0.75\linewidth}
\newcommand\@interlineado{1.2}
\newcommand\@espteo{-0.75ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Colores predeterminados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Los siguientes son los colores predefinidos de la clase.
\definecolor{colordef}{cmyk}{0.81,0.62,0.00,0.22}
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Universidad
\newcommand{\universidad}[1]%
    {\renewcommand\@universidad{#1}}
%%  Materia
\newcommand{\materia}[1]%
    {\newcommand\@materia{#1}}
%%  Nombre
\newcommand{\nombre}[1]%
    {\newcommand\@nombre{ #1}}
%%  Semestre
\newcommand{\semestre}[1]%
    {\newcommand\@semestre{ #1}}
%%  Siglas
\newcommand{\sigla}[1]%
    {\newcommand\@sigla{ #1}}
%%  Fecha
\newcommand{\fecha}[1]%
    {\newcommand\@fecha{#1}}
%%  Tema
\newcommand{\tema}[1]%
    {\newcommand\@tema{#1}}
%%  Tema1
\newcommand{\subtema}[1]%
    {\newcommand\@subtema{#1}}
%% Encabezado
\newcommand{\encabezado}{
    \vspace{-25mm}
    \begin{center}
	\hrule
	\vspace{8pt}
	\textbf{ \textsc { \large \@universidad}}
    \end{center}
    \textbf{Nombre:} \@nombre \hspace{\fill} \textbf{Fecha:} \@fecha \newline
    \textbf{Tema:} \@tema \hspace{\fill}  \textbf{Materia:} \@materia \hspace{3pt}- \@sigla
    \vspace{8pt}
    \hrule
    \begin{center}\small
    \textbf{\textsc{\@subtema}}
    \end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Interlineado
\renewcommand{\baselinestretch}{\@interlineado}
%%  Encabezado y pie de página
\fancyfoot[C]{\thepage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo títulos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Estilo de sección
% \titleformat{\section}[display]
%     {\vspace*{-1mm}\bfseries\scshape\centering}
%     {}{1ex}
%     {\color{colordef}\large\titlerule\vspace{.05ex} \thesection.\ }
%     [\color{colordef}\vspace{.2ex}\titlerule]
% %%  Estilo subsecciones
% \titleformat{\subsection}
%     {\color{colordef}\normalsize\bfseries}
%     {\thesubsection}{1em}{}

% Ejercicio
% \newcounter{ejer}
% \newenvironment{ejercicio}{\refstepcounter{ejer}
% \par \medskip \noindent \textbf{Ejercicio \theejer:} }


%% Solución
\newenvironment{solucion}[1][Solución]
      {\begingroup\color{colordef}\begin{proof}[#1]\relax}
      {\end{proof}\endgroup}

\renewcommand{\baselinestretch}{1.2}
\makeatletter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo teoremas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Keys temporales: |tipo|,|color| y |contador|.
\def\tcb@@tipo{} 
    \tcbset{ tipo/.code = {\def\tcb@@tipo{#1} } }
\def\tcb@@contador{} 
    \tcbset{ contador/.code = {\def\tcb@@contador{#1} } }
\def\tcb@@color{colordef} 
    \tcbset{ color/.code = {\def\tcb@@color{#1} } }
\def\tcb@@icono{{\large\faWarning}} 
    \tcbset{ icono/.code = {\def\tcb@@icono{#1} } }
%%  Estilo de teorema clasico
\newtheoremstyle{estiloteorema}%
    {9pt}{9pt}{}{0pt}{\bfseries\scshape\color{\tcb@@color}}{.}{ }{}
%%  Estilo de teorema nuevo
\newtheoremstyle{estiloteoreman}%
    {9pt}{9pt}{}{0pt}{\bfseries\sffamily\color{black}}{.}{ }{}
%%  Recuadro sin título aparte
\tcbset{ recuadrost/.style ={
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=\tcb@@color!5,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    parbox=false
    }
    }
%%  Formatos del estilo clásico
% Escritura del título
\newcommand\tbc@escrituratitulo[1][]{%
    \strut{%
        \bfseries\scshape\tcb@@tipo~\arabic{\tcb@@contador}%
            \ifthenelse{\equal{#1}{}}{}{:\upshape~#1}%
        }
    }
% Dibujo del título a la izquierda
\newcommand\tbc@dibujotituloizq[1][]{%
    % Creación del nombre para medirlo
    \node[xshift=13pt,yshift=\@espteo,thick,anchor=west](titulo) at (frame.north west)%
        {\tbc@escrituratitulo[#1]};
    % Sombra del recuadro
    \path[fill=\tcb@@color!60!black]
        ([yshift=-1.75ex,xshift=-0.1ex]titulo.north west) 
        arc[start angle=0,end angle=180,radius=0.9ex]
        ([yshift=-1.75ex,xshift=0.1ex]titulo.north east) 
        arc[start angle=180,end angle=0,radius=0.9ex];
    % Recuadro
    \path[fill=\tcb@@color!20]
        % Linea superior
        ([xshift=-0.9ex,yshift=-0.85ex]titulo.north west) 
        -- ([xshift=0.9ex,yshift=-0.85ex]titulo.north east)
        % Linea inferior
        [rounded corners=0.7ex]  --  ([xshift=0.4ex,yshift=-0.95ex]titulo.north east)--
        ([yshift=0.6ex]titulo.south east) -- ([yshift=0.6ex]titulo.south west)
        % Ciclo
        --  ([xshift=-0.4ex,yshift=-0.95ex]titulo.north west) 
        [sharp corners] -- cycle;
    % Escritura del nombre
    \node[xshift=13pt,yshift=-0.8ex,thick,anchor=west] at (frame.north west)%
        {\tbc@escrituratitulo[#1]};
    }
%  Recuadro con título aparte a la izquierda
\tcbset{ recuadroctizq/.style ={
    % Opciones generales
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=\tcb@@color!5,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=4mm,bottom=0.5mm,left=2mm,right=2mm,
    topsep at break=-4mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    parbox=false,
    % Dibujo del título
    overlay unbroken and first = {\tbc@dibujotituloizq[#1]}
    }
    }
% Dibujo del título a la derecha
\newcommand\tbc@dibujotituloder[1][]{%
    % Creación del nombre para medirlo
    \node[xshift=-13pt,yshift=\@espteo,thick,anchor=east](titulo) at (frame.north east)%
        {\tbc@escrituratitulo[#1]};
    % Sombra del recuadro
    \path[fill=\tcb@@color!60!black]
        ([yshift=-1.75ex,xshift=-0.1ex]titulo.north west) 
        arc[start angle=0,end angle=180,radius=0.9ex]
        ([yshift=-1.75ex,xshift=0.1ex]titulo.north east) 
        arc[start angle=180,end angle=0,radius=0.9ex];
    % Recuadro
    \path[fill=\tcb@@color!20]
        % Linea superior
        ([xshift=-0.9ex,yshift=-0.85ex]titulo.north west) 
        -- ([xshift=0.9ex,yshift=-0.85ex]titulo.north east)
        % Linea inferior
        [rounded corners=0.7ex]  --  ([xshift=0.4ex,yshift=-0.95ex]titulo.north east)--
        ([yshift=0.6ex]titulo.south east) -- ([yshift=0.6ex]titulo.south west)--  
        % Ciclo
        ([xshift=-0.4ex,yshift=-0.95ex]titulo.north west) 
        [sharp corners] -- cycle;
    % Escritura del nombre
    \node[xshift=-13pt,yshift=-0.8ex,thick,anchor=east] at (frame.north east)%
        {\tbc@escrituratitulo[#1]};
    }
%  Recuadro con título aparte a la derecha
\tcbset{ recuadroctder/.style ={
    % Opciones generales
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=\tcb@@color!5,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=4mm,bottom=0.5mm,left=2mm,right=2mm,
    topsep at break=-4mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    parbox=false,
    % Dibujo del título
    overlay unbroken and first= {\tbc@dibujotituloder[#1]}
    }
    }
%%  Formatos del estilo nuevo
%  Recuadro con título aparte interno
\tcbset{ recuadroctint/.style ={
    % -> Opciones generales
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=gray!5,colframe=gray!5,colbacktitle=gray!5,
    boxrule=0pt,toprule=0.4pt,
    drop fuzzy shadow,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    parbox=false,
    % Dibujo del título
    overlay unbroken and first = {
        % Borde superior grueso
        \draw[\tcb@@color,line width =2.5cm]
            ([xshift=1.25cm, yshift=0cm]frame.north west)--+(0pt,3pt);
        },
    overlay middle and last = { },
    title={
            \bfseries\sffamily\color{\tcb@@color}
                \tcb@@tipo~\arabic{\tcb@@contador}%
                \ifthenelse{\equal{#1}{}}{}{:~~--#1--}%
        },
    }
    }
%%  Ambiente advertencia
\tcbset{ postit/.style ={
    % -> Opciones generales
    breakable,enhanced,
    before skip=2mm,after skip=3mm,
    colback=\tcb@@color!50,colframe=\tcb@@color!20!black,
    boxrule=0.4pt,
    drop fuzzy shadow,
    left=6mm,right=2mm,top=0.5mm,bottom=0.5mm,
    sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
    parbox=false,
    underlay unbroken and last = {%
        \path[fill=tcbcol@back!80!black] 
        ([yshift=3mm]interior.south east) --++ (-0.4,-0.1) --++ (0.1,-0.2);
        \path[draw=tcbcol@frame,shorten <=-0.05mm,shorten >=-0.05mm]
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
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Definición de ambientes de teoremas estilo clásico
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Ambientes sin recuadro: |ejem| y |obs|
\theoremstyle{estiloteorema}
    \newtheorem{ejem}{Ejemplo}
    \ifthenelse{\equal{\@numobs}{true}}
        {\newtheorem{obs}{Observaci\'on}[section]}
        {\newtheorem*{obs}{Observaci\'on}}
%%  Ambientes con recuadrost: |prop|, |cor|, |lem|, |ejer|.
\theoremstyle{estiloteorema}
    \newtheorem{prop}{Proposici\'on}
        \tcolorboxenvironment{prop}{color=black,recuadrost}
    \newtheorem{cor}[prop]{Corolario}
        \tcolorboxenvironment{cor}{color=black,recuadrost}
    \newtheorem{lem}[prop]{Lema}
        \tcolorboxenvironment{lem}{color=black,recuadrost}
    \newtheorem{ejer}{Ejercicio}
        \tcolorboxenvironment{ejer}{color=colordef,recuadrost}
%%  Ambientes con título aparte: |teo|.
\newtcolorbox{teo}[1][]
    {tipo=Teorema,contador=prop,color=colordef,recuadroctizq={#1}}
%%  Ambientes con título aparte: |defi|.
\newcounter{defi}[section]
\renewcommand{\thedefi}{\arabic{defi}}
\newtcolorbox{defi}[1][]
    {tipo=Definición,contador=defi,color=colordef,recuadroctizq={#1}}
%%  Ambientes con título aparte: |axioma|.
\newcounter{axioma}[section]
\renewcommand{\theaxioma}{\arabic{axioma}}
\newtcolorbox{axioma}[1][]
    {tipo=Axioma,contador=axioma,color=colordef,recuadroctizq={#1}}
%%  Ambientes advertencia: |advertencia|.
\newtcolorbox{advertencia}
    {color=yellow,postit}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Definición de ambientes de teoremas estilo nuevo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Ambientes sin recuadro: |ejemn| y |obsn|
\theoremstyle{estiloteoreman}
    \newtheorem{ejemn}{Ejemplo}
    % \ifthenelse{\equal{\@numobs}{true}}
        % {\newtheorem{obsn}{\tikz \fill[black] (1ex,1ex) circle (3.5pt); Observaci\'on}[section]}
        % {\newtheorem*{obsn}{\tikz \fill[black] (1ex,1ex) circle (3.5pt); Observaci\'on}
        %}
    \newtheorem{obsn}{\tikz \fill[black] (1ex,1ex) circle (3.5pt); Observaci\'on}
%%  Ambientes con recuadrost: |propn|, |corn|, |lemn|, |ejern|.
\theoremstyle{estiloteoreman}
    \newtheorem{propn}{Proposici\'on}
        \tcolorboxenvironment{propn}{%
            color=black,recuadrost,colback=gray!5,drop fuzzy shadow
        }
    \newtheorem{corn}[propn]{Corolario}
        \tcolorboxenvironment{corn}{%
            color=black,recuadrost,colback=gray!5,drop fuzzy shadow
        }
    \newtheorem{lemn}[propn]{Lema}
        \tcolorboxenvironment{lemn}{%
            color=black,recuadrost,colback=gray!5,drop fuzzy shadow
        }
    \newtheorem{ejern}[prop]{Ejercicio}
        \tcolorboxenvironment{ejern}{%
            color=colordef,recuadrost,colback=gray!5,drop fuzzy shadow
        }
%%  Ambientes con título aparte: |teon|.
\newtcolorbox{teon}[1][]
    {tipo=Teorema,contador=prop,color=black,recuadroctint={#1}}
%%  Ambientes con título aparte: |defi|.
\newcounter{defin}[section]
\renewcommand{\thedefin}{\arabic{defin}}
\newtcolorbox{defin}[1][]
    {tipo=Definici\'on,contador=defin,color=black,recuadroctint={#1}}
%%  Ambientes con título aparte: |axioma|.
\newcounter{axioman}[section]
\renewcommand{\theaxioman}{\arabic{axioman}}
\newtcolorbox{axioman}[1][]
    {tipo=Axioma,contador=axioman,color=colordef,recuadroctint={#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


