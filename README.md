# 南臺科技大學碩博士 LaTeX 論文模板

## 前言

鑑於各系或是實驗室產出的論文排版品質不一，導致後續的學弟妹們參考時很是迷惘。

為此，本模板將以學校釋出的[論文模板](./texmf/doc/THESIS_example.pdf)作為準則，並使用 LaTeX 排版，不必再煩惱論文排版的設定。

使用方法可參考[此說明檔](./instructions/usage.md)。

進一步了解各檔案的用途，可參考[此說明檔](./instructions/purpose.md)。

## 行前準備

請依本身的作業系統安裝以下套件：

- texlive
- make

```bash
# Debian
apt-get install texlive \
	texlive-xetex \
	texlive-lang-chinese \
	texlive-bibtex-extra \
	texlive-science \
	texlive-publishers \
	latex-cjk-all \
	ttf-mscorefonts-installer	# For 'Times New Roman'
```

### 字型

本模板總共使用兩種字型，請依自身的作業系統分別安裝:
- 英文: Times New Roman
- 中文: 國發會提供的[全字庫正楷體](https://data.gov.tw/dataset/5961)，位於本資料夾中的 `texmf/fonts/truetype`，此字體渲染效果最好。

```bash
# Methods below supports GNU/Linux
$ make font.check				# 檢查全字庫正楷體是否已安裝
$ sudo make font.install			# 以root權限安裝全字庫正楷體
```

## 致謝

特別感謝我的指導教授，南臺科技大學電子工程系的李博明教授。多虧老師才能組成此論文模板的關鍵部分！
