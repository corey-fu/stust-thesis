# 南臺科技大學碩博士 LaTeX 論文模板

## 前言

鑑於各系或是實驗室產出的論文排版品質不一，導致後續的學弟妹們參考時很是迷惘。

為此，本模板將以學校釋出的[論文模板](./texmf/doc/THESIS_example.pdf)作為準則，並使用 LaTeX 排版，不必再煩惱論文排版的設定。

## 結構

```bash
├── bookspine.tex
├── chapters
│   ├── abstract.tex
│   ├── acknowledgements.tex
│   ├── appendix.tex
│   ├── introduction.tex
│   └── symbols.tex
├── docs
├── information.tex
├── logo
│   ├── STUST_LOGO.jpg
│   └── STUST_LOGO_m.png
├── main.pdf
├── main.tex
├── makefile
├── output
│   └── main_final.pdf
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
│       │   ├── THESIS_example.doc
│       │   └── THESIS_example.pdf
│       └── latex
│           ├── diagram.sty
│           ├── stust-config.sty
│           ├── stust-thesis.cls
│           └── xCJKnumb.sty
└── texmf.cnf
```

### bib檔

references.bib ： 存放參考文獻的檔案。

### tex檔

bookspine.tex ： 書脊 （目前開發中，請勿使用）。

information.tex ： 論文相關資訊（標題、作者、日期等...）。

main.tex ： 主檔案，可在此加入位於 chapters 的 tex 檔案，論文輸出檔為 `main.pdf`。

### sty檔

stust-config.sty ： 本模板的設定檔，可適用於其他類型的文件（例如**研討會**）。

xCJKnumb.sty ： 可產生中日韓數字的設定檔，[來源](http://latex.ustc.googlepages.com/xCJKnumb.tar.gz)在此。

diagram.sty ： 本模板定義的流程圖各符號之設定檔。

### cls檔

stust-thesis.cls ： 本模板所使用的 class 類型檔案，用來新增、定義、重新定義 LaTeX 命令。

### 資料夾

chapters ： 放置章節的tex檔案。

logo ： 學校的Logo。

source_code ： 放置原始碼（optional）。

texmf ： 放置定義此模板的檔案（參考用）。

## 行前準備

請依本身的作業系統安裝以下工具：

- Windows/MacOS : MikTeX （**請安裝所有的texlive套件**）
- GNU/Linux : 各發行版本中包含texlive的套件

```bash
# Debian
apt-get install texlive \
	texlive-xetex \
	texlive-lang-chinese \
	texlive-bibtex-extra \
	texlive-science \
	texlive-publishers \
	latex-cjk-all \
	ttf-mscorefonts-installer # For 'Times New Roman'
```

### 字型

本模板總共使用兩種字型，請安裝:
- 英文: Times New Roman (pkg for debian: ``ttf-mscorefonts-installer``)
- 中文: 國發會提供的[全字庫正楷體](https://data.gov.tw/dataset/5961)，位於本資料夾中的 `texmf/fonts/truetype`。 

```bash
$ make font.check			# 檢查全字庫正楷體是否已安裝
$ sudo make font.install	# 安裝全字庫正楷體
```

## 使用方法

> 目前只支援GNU/Linux作業系統下使用 ``make`` ， Windows/Mac用戶目前請手動編譯。

請於本資料夾中使用 `make` 工具編譯 `main.tex` ， 即可產出論文 `main.pdf` ， 以下為使用範例：

```bash
$ make tex.build 			# 編譯主檔案
$ make tex.all   			# 編譯主檔案及參考文獻
```

## 開始撰寫

> 若是第一次接觸 LaTeX 可參考 [大家來學LATEX](https://jupiter.math.nctu.edu.tw/~smchang/latex/latex123.pdf) ， 非常推薦大家拜讀由李果正先生所撰寫的說明文件。

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

只需輸入一次，相關資訊將會用至**封面頁**、**書名頁**、**書脊頁**中。

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
