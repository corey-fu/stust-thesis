# 南臺科技大學碩博士 LaTeX 論文模板

## 前言

鑑於各系或是實驗室產出的論文排版品質不一，導致後續的學弟妹們參考時很是迷惘。

為此，本模板將以學校釋出的[論文模板](./texmf/doc/THESIS_example.pdf)作為準則，並使用 LaTeX 排版，不必再煩惱論文排版的設定。

## 結構

```bash
.
├── bookspine.tex
├── censorship.pdf
├── censorship.tex
├── chapters
│   ├── abstract.tex
│   ├── acknowledgements.tex
│   ├── appendix.tex
│   ├── introduction.tex
│   └── symbols.tex
├── information.tex
├── logo
│   ├── STUST_LOGO.jpg
│   └── STUST_LOGO_m.png
├── main.pdf
├── main.tex
├── README.md
├── references.bib
├── source_code
│   └── text.py
├── texmf
│   ├── fonts
│   │   └── truetype
│   │       └── TW-Kai-98_1.ttf
│   └── tex
│       ├── doc
│       │   ├── bookspine.doc
│       │   ├── censorship.odt
│       │   ├── THESIS_example.doc
│       │   └── THESIS_example.pdf
│       └── latex
│           ├── config.sty
│           ├── diagram.sty
│           ├── stust-thesis.cls
│           └── xCJKnumb.sty
└── texmf.cnf

```

### tex檔

bookspine.tex ： 書脊 （目前開發中，請勿使用）。

censorship.tex  ： 口試委員審定書（請單獨編譯）。

information.tex ： 論文相關資訊（標題、作者、日期等...）。

main.tex ： 主檔案，可在此加入位於 chapters 的 tex 檔案，論文輸出檔為 `main.pdf`。

### sty檔

config.sty ： 本模板的設定檔，可適用於其他類型的文件（例如**研討會**）。

xCJKnumb.sty ： 產生中文數字的設定檔，[來源](http://latex.ustc.googlepages.com/xCJKnumb.tar.gz)在此。

diagram.sty ： 本模板定義的流程圖各符號之設定檔。

### cls檔

stust-thesis.cls ： 本模板所使用的 class 類型檔案，用來新增、定義、重新定義 LaTeX 命令。

### 資料夾

chapters ： 放置章節的tex檔案。

logo ： 學校的Logo。

source_code ： 放置原始碼。

texmf ： 放置定義此模板的檔案。

## 行前準備

請依本身的作業系統安裝以下工具：

- Windows/MacOS : MikTex
- GNU/Linux : 各發行版本中包含texlive的套件

```bash
# Debian
apt-get install texlive \
	texlive-xetex \
	texlive-lang-chinese \
	texlive-bibtex-extra \
	texlive-science \
	latex-cjk-all
```

### 字型

本模板使用的是國發會所提供的[全字庫正楷體](https://data.gov.tw/dataset/5961)，位於本資料夾中的 `texmf/fonts/truetype` ，請安裝此字型，否則會編譯失敗。

### 環境設定（類Unix發行版本）

由於本模板是使用客製化的class及sty類型設定檔案，為了讓 LaTeX 在編譯時可辨認到該檔案，有兩種方法：

1. 將位於 `texmf` 裡的所有`cls`及`sty`類型檔案都複製至 texlive 的系統路徑（推薦）
2. 設定環境變數

第一種就不多做解釋了，第二種的話是位於此資料夾並直接在BASH環境底下執行：

```bash
export TEXMFHOME=./texmf
```

## 使用方法

TeX 引擎請使用 `xelatex` ，產生參考文獻請使用 `bibtex` ，執行順序如下：

xelatex → bibtex → xelatex

※執行bibtex時請注意不要包含 ` .tex ` 副檔名，不然會出錯！

## 開始撰寫

### 論文相關資訊

請編輯 `information.tex` 中的：

```tex
% Usage : \info{English}{Chinese}
%% 大學
\university{Southern Taiwan University of Science and Technology}{南臺科技大學}
%% 系所
\institute{Electronic Engineering}{電子工程系}
%% 學位
\degree{master}{碩士}
%% 論文主題/題目
\title{Thesis Template in \LaTeX{} for STUST}{南臺科技大學碩博士 \LaTeX{} 論文模板}
%% 作者/學生
\author{Your name}{你的名字}
%% 學號
\stuID{MA830213}
%% 指導教授
\advisor{Advisor's name}{指導教授的名字}
%% 所長/系主任
\director{Director's name}{系主任的名字}
%% 西元/民國 年月日
\year{2021}{一一〇}
\month{07}{七}
\day{15}{十五}
```

相關資訊將會用至封面頁、書名頁、書脊頁、口試委員審定書中。

### 自定義環境

本模板已定義中英文的**摘要**、**致謝**、**符號彙編**環境，以摘要為例，用法如下：

```tex
% Abstract
\begin{abstract}{cht}

    這是中文摘要。

    \keywords[cht]{摘要、\LaTeX{}、模板}

\end{abstract}

\begin{abstract}

    This is abstract of english version.

    \keywords{abstract, \LaTeX{}, template}

\end{abstract}
```

- `\begin{abstract}{cht}` → 多加 `{cht}` 代表該環境的章節標題已設定為繁體中文，也就是 `摘要`
- `\begin{abstract}` → 則設定為英文： `Abstract`

