# Author: Yan-Guo Fu (CoreyFu) 
# Contact: mailto:MA830213@stust.edu.tw / mailto:c12378978@gmail.com

# Program
TEX_PROG = xelatex
BIB_PROG = biblatex

# File
FILE = main
TEX = $(FILE).tex
PAPER = $(FILE).pdf

# Location
DST = output
#CONFIG = /usr/share/texlive/texmf-dist/tex/latex/stust

# Variables
TEXMFHOME = texmf

# Error
FONTS_NOT_FOUND = $(error Please check fonts have been installed!)
xCJKnumb_NOT_FOUND = $(error Please check xCJKnumb has been installed!)

.PHONY: fonts
fonts:
	cp texmf/fonts/truetype/* /usr/share/fonts/truetype/
	fc-cache

.PHONY: all
all:
	TEXMFHOME=$(TEXMFHOME) $(TEX_PROG) $(TEX)
	$(BIB_PROG) $(TEX)
	TEXMFHOME=$(TEXMFHOME) $(TEX_PROG) $(TEX)

.PHONY: clean
clean:
	-rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.nav *.out *.snm *.xdv *.toc 

.PHONY: err
err: ; $(FONT_NOT_FOUND)
