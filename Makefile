all: adversarial-queues.pdf

assets/%.eps: probz.ipynb
	jupyter nbconvert --execute probz.ipynb --to notebook
	rm probz.nbconvert.ipynb

adversarial-queues.pdf: adversarial-queues.bib adversarial-queues.tex assets/inclusion-probz.eps assets/position-probz.eps
	pdflatex -synctex=1 -interaction=batchmode -output-directory=build adversarial-queues.tex 
	biber build/adversarial-queues.bcf --quiet
	pdflatex -synctex=1 -interaction=batchmode -output-directory=build adversarial-queues.tex 
