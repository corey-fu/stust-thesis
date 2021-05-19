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

### bib檔

references.bib ： 存放參考文獻的檔案。

### tex檔

bookspine.tex ： 書脊 （目前開發中，請勿使用）。

censorship.tex  ： 口試委員審定書（請單獨編譯）。

information.tex ： 論文相關資訊（標題、作者、日期等...）。

main.tex ： 主檔案，可在此加入位於 chapters 的 tex 檔案，論文輸出檔為 `main.pdf`。

### sty檔

config.sty ： 本模板的設定檔，可適用於其他類型的文件（例如**研討會**）。

xCJKnumb.sty ： 可產生中日韓數字的設定檔，[來源](http://latex.ustc.googlepages.com/xCJKnumb.tar.gz)在此。

diagram.sty ： 本模板定義的流程圖各符號之設定檔。

### cls檔

stust-thesis.cls ： 本模板所使用的 class 類型檔案，用來新增、定義、重新定義 LaTeX 命令。

### 資料夾

chapters ： 放置章節的tex檔案。

logo ： 學校的Logo。

source_code ： 放置原始碼（optional）。

texmf ： 放置定義此模板的檔案。

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
	latex-cjk-all
```

### 字型

本模板並不使用微軟提供的標楷體，取而代之的是國發會所提供的[全字庫正楷體](https://data.gov.tw/dataset/5961)，位於本資料夾中的 `texmf/fonts/truetype` ，請安裝此字型，否則會編譯失敗。

### 環境設定

由於本模板是使用客製化的 `cls` 及 `sty` 類型設定檔案，為了讓 LaTeX 在編譯時可辨認到，有以下作法：

1. 將位於 `texmf` 裡的所有 `cls` 及 `sty` 類型檔案都複製至 texlive 的系統路徑。
2. MikTeX 的使用者可新增位於本資料夾中的 `texmf` ，使用其作為設定檔的根目錄，詳情請參考 MikTex [官方說明](https://miktex.org/kb/texmf-roots)。
3. 承上，類UNIX或GNU/Linux作業系統的使用者可於終端機中設定環境變數 ： `export TEXMFHOME=./texmf` 。

## 使用方法

> 以下只說明在類UNIX或GNU/Linux作業系統下的使用方法

大方向：TeX 引擎請使用 `xelatex` ，若需產生參考文獻請使用 `bibtex`，相關細節請依照你的IDE調整。

若是第一次接觸 LaTeX 可參考 [大家來學LATEX](https://jupiter.math.nctu.edu.tw/~smchang/latex/latex123.pdf) ， 非常推薦大家拜讀由李果正先生所撰寫的說明文件。

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

只需輸入一次，相關資訊將會用至**封面頁**、**書名頁**、**書脊頁**、**口試委員審定書**中。

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

### 編譯順序

1. 編輯完 `information.tex` 後請單獨編譯口試委員審定書（`censorship.tex`）：

   ```bash
   xelatex censorship.tex
   ```

   待產出`censorship.pdf`後，再編譯論文（`main.tex`）。

2. 新增或修改章節（`chapters/*.tex`）或交互參照（`\cite{}`）或參考文獻（`reference.bib`）的內容。

3. 接著編譯論文（`main.tex`），其執行順序如下：

   ```bash
   xelatex main.tex
   bibtex main 
   xelatex main.tex
   xelatex main.tex
   ```

   ※執行 `xelatex` 時包含或不包含 ` .tex ` 副檔名都可執行，唯有執行 `bibtex` 時請注意不要包含 ` .tex ` 副檔名，不然會出錯！
