# 用途 

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

## 說明

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
