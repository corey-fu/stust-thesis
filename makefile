# Author: Yan-Guo Fu (CoreyFu) 
# Contact: mailto:MA830213@stust.edu.tw / mailto:coreyfu088@gmail.com

# PROGRAM 
TEX_PROG = xelatex
BIB_PROG = bibtex

# FILE
MAIN = main
FINAL = main_fianl
TEX := $(MAIN).tex
PAPER := $(MAIN).pdf
PAPER_FINAL := $(FINAL).pdf
FONT_TW = TW-Kai-98_1.ttf
OBJ := *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc

# PATH 
DST = output
CHA = chapters
PATH_TO_FONT_LOCAL = ./texmf/fonts/truetype
PATH_TO_FONT_GLOBAL = /usr/share/fonts
PATH_TO_FONT_TW := $(PATH_TO_FONT_GLOBAL)/truetype/ndc

# TEXMF
TEXMF_LOCAL = ./texmf

# ERROR
ERROR_IEEEtran = $(error I couldn't open style file IEEEtran.bst)

# EXECUTION
.PHONY: all install clean

tex.build: 
	TEXMFHOME=$(TEXMF_LOCAL) $(TEX_PROG) $(TEX) 			# Create/Change contents

tex.all: tex.build 
	$(BIB_PROG) $(MAIN)						# Compile the bibliography
	TEXMFHOME=$(TEXMF_LOCAL) $(TEX_PROG) $(TEX) 			# Create/Change contents

tex.clean: 
	@echo "Removing staging files..."
	@rm -f $(OBJ)
	@rm -f $(CHA)/*.aux

tex.distclean: tex.clean 
	@echo "Removing thesis paper..."
	@rm -f $(PAPER)

font.check:
ifeq ($(shell fc-list |grep "$(FONT_TW)"),)
	@echo "$(FONT_TW) is not installed yet..."
else
	@echo "$(FONT_TW) has been installed!" && exit 1
endif

font.install: font.check
ifneq ($(shell id -u), 0)
	@echo "Please install fonts with root privilege!"		# Reminds users become root to use
else
	@echo "Installing $(FONT_TW)..."
	@mkdir -p $(PATH_TO_FONT_TW) 					# Create ndc directory in PATH
	@cp $(PATH_TO_FONT_LOCAL)/$(FONT_TW) $(PATH_TO_FONT_TW)		# Copy font to ndc directory
	@fc-cache							# Install it
	$(font.check)
endif

