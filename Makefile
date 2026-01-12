venv:
	python3 -m venv .venv
install:
	. .venv/bin/activate && pip install -r requirements.txt

setup: venv install

clean-all: clean
	rm -rf .venv
clean-model:
	rm -rf models
clean:
	rm -rf data/processed target
prepare:
	mkdir -p target
	. .venv/bin/activate && cd notebooks && papermill 01_data_preparation.ipynb ../target/01_data_preparation_output.ipynb
#	. .venv/bin/activate && cd notebooks && papermill 01_data_preparation-spark.ipynb ../target/01_data_preparation-spark_output.ipynb
train:
	mkdir -p target
	. .venv/bin/activate && cd notebooks && papermill 02_model_fitting_tensorflow_keras.ipynb ../target/02_model_fitting_tensorflow_keras_output.ipynb
prediction:
	mkdir -p target
	. .venv/bin/activate && cd notebooks && papermill 03_model_prediction.ipynb ../target/03_model_prediction_output.ipynb


tf-fit: clean clean-model prepare train
