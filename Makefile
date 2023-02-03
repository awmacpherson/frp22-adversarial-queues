all: adversarial-queues.pdf

assets/%.eps: probz.ipynb
	mkdir -p assets
	jupyter nbconvert --execute probz.ipynb --to notebook
	rm probz.nbconvert.ipynb

adversarial-queues.pdf: adversarial-queues.bib adversarial-queues.tex assets/inclusion-probz.eps assets/position-probz.eps
	mkdir -p build
	pdflatex -synctex=1 -interaction=batchmode -output-directory=build adversarial-queues.tex 
	biber build/adversarial-queues.bcf --quiet
	pdflatex -synctex=1 -interaction=batchmode -output-directory=build adversarial-queues.tex 

clean:
	rm -f build/*
	rm -f assets/*
