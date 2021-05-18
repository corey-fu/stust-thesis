# 南臺科技大學碩博士 LaTeX 論文模板

## 前言

鑑於各實驗室產出的論文排版品質不一，導致後續的學弟妹們參考時很是迷惘。

為此，本模板將以學校釋出的[論文模板](./texmf/doc/THESIS_example.pdf)作為準則，並使用LaTeX排版，讓學弟妹們不必再煩惱論文排版的設定。

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

bookspine.tex ： 書脊 （開發中，請勿使用）

censorship.tex  ： 口試委員審定書（請單獨編譯）

information.tex ： 論文相關資訊（標題、作者、日期等...）

main.tex ： 主檔案，可在此加入位於chapters的tex檔案

### 資料夾

chapters ： 放置章節的tex檔案

logo ： 學校的Logo

source_code ： 放置原始碼

texmf ： 放置定義此模板的檔案

## 行前準備

請依本身的作業系統安裝以下工具：

- Windows : MikTex
- GNU/Linux
  - Debian : texlive

### 字型

本模板使用的是國發會所提供的[全字庫正楷體](https://data.gov.tw/dataset/5961)，位於本資料夾中的 `texmf/fonts/truetype` ，請安裝此字型，否則會編譯失敗。

### 環境設定（類Unix發行版本）

由於本模板是使用客製化的class及sty類型檔案，為了讓檔案在編譯時可辨認到，有兩種方法：

- 將class及sty類型檔案複製至系統路徑（推薦）
- 設定環境變數

第一種就不多做解釋了，第二種的話是位於此資料夾並直接在BASH環境底下執行：

```bash
export TEXMFHOME=./texmf
```

## 使用方法

TeX 引擎請使用xelatex，產生參考文獻請使用bibtex，執行順序如下：

xelatex → bibtex → xelatex

