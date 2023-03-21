# Name of manuscript
manuscript = mc2023_template

# PdfLaTeX compilation options
latexopt = -halt-on-error -file-line-error -output-directory=build

#=================================================================
# Generate PDF of manuscript using PdfLaTeX
#=================================================================

all: pdf

pdf: $(manuscript).tex
	mkdir -p build
	pdflatex $(latexopt) $(manuscript)
	pdflatex $(latexopt) $(manuscript)
	mv build/$(manuscript).pdf build/..


pdfbibtex: $(manuscript).tex mc2023.bib
	mkdir -p build
	pdflatex $(latexopt) $(manuscript)
	bibtex -terse build/$(manuscript)
	pdflatex $(latexopt) $(manuscript)
	pdflatex $(latexopt) $(manuscript)

#=================================================================
# Other
#=================================================================

clean:
	rm -rf build

spellcheck:
	aspell -c $(manuscript).tex --mode=tex

.PHONY: all clean
