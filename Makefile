REF          = reference
BIB          = $(REF)/bib.bib
CSL          = $(REF)/mla.csl

TEMPLATE_DIR = templates
TEMPLATE     = $(TEMPLATE_DIR)/fancy.latex

PANDOC       = /usr/bin/pandoc
PANDOC_FLAGS = --filter pandoc-citeproc \
	       --bibliography $(BIB) \
	       --csl $(CSL) \
	       --template $(TEMPLATE)

src          = $(wildcard *.md)
pdf          = $(src:.md=.pdf)

all: $(pdf)

fancy: TEMPLATE = $(TEMPLATE_DIR)/fancy.latex
fancy: $(pdf)

plain: TEMPLATE = $(TEMPLATE_DIR)/plain.latex
plain: $(pdf)

%.pdf: %.md
	$(PANDOC) $(PANDOC_FLAGS) $< -o $@

.PHONY: clean
clean:
	@-rm $(pdf)
