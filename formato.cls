%%
%% Clase para dar formato a documentos
%% Copyright (C) 2019 by Daniel Lara <daniel.lara@alephsub0.org>
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formato}[2019/08/12 v1.0]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Inicialización
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Primero definimos una serie de comandos auxiliares para las opciones
\newcommand\@idioma{spanish,es-noitemize}
\newcommand\@tipografia{}
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
\DeclareOption{A4-l}{
    \PassOptionsToPackage{paperwidth=297mm,paperheight=210mm,twoside,
    inner=1.2cm,outer=1.2cm,top=1.2cm,bottom=1.2cm}{geometry}}
\DeclareOption{A4-N}{
    \PassOptionsToPackage{paperwidth=210mm,paperheight=297mm,twoside,
    inner=3cm,outer=3cm,top=2.5cm,bottom=2.5cm,headsep=10pt,
  headheight=22pt}{geometry}}
\DeclareOption{A5}{
    \PassOptionsToPackage{paperwidth=148mm,paperheight=210mm,twoside,
    inner=1.7cm,outer=1.7cm,top=2.25cm,bottom=2.25cm}{geometry}}
\DeclareOption{Toriginal}{\renewcommand\@tipografia{toriginal}}
\DeclareOption{Tnueva}{\renewcommand\@tipografia{tnueva}}
%%  Opciones predeterminadas son |A4-s| y |10pt|.
\ExecuteOptions{A4-s,10pt,Toriginal}
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
\RequirePackage{mathrsfs}
\RequirePackage{calc}
\RequirePackage{etex}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amsthm}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{amssymb}
\RequirePackage{setspace}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{textcase}
\RequirePackage{nextpage}
\RequirePackage{titletoc}
\RequirePackage{xparse}
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
%% --- Estilo página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Interlineado
\renewcommand{\baselinestretch}{\@interlineado}
%%  Encabezado y pie de página
\fancyfoot[C]{\thepage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo de tipografía
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\equal{\@tipografia}{Toriginal}}{}
{
    \RequirePackage{mathpazo}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
