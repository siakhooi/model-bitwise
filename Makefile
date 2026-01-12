venv:
	python3 -m venv .venv

install:
	. .venv/bin/activate && pip install -r requirements.txt

clean:
	rm -rf .venv data/processed target

run:
	mkdir -p target
	. .venv/bin/activate && cd notebooks && papermill 01_data_preparation.ipynb ../target/01_data_preparation_output.ipynb