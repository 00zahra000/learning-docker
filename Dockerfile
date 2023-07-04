# pull official base image
FROM python:3.10


RUN apt update && apt-get update
RUN apt install curl

ENV PYTHONUNBUFFERED 1
RUN mkdir /my_app_dir
WORKDIR /my_app_dir

ADD . /my_app_dir/
RUN pip install --upgrade pip
RUN torch-model-archiver --model-name fcn_resnet_101 --version 1.0 --model-file /my_app_dir/image_segmenter/fcn/model.py --serialized-file /my_app_dir/fcn_resnet101_coco-7ecb50ca.pth --handler image_segmenter --extra-files /my_app_dir/image_segmenter/fcn/fcn.py,examples/image_segmenter/fcn/intermediate_layer_getter.py
RUN mkdir -p /my_app_dir/model_store
RUN mv /my_app_dir/fcn_resnet_101.mar /my_app_dir/model_store/

# ADD requirements.txt /my_app_dir/
# RUN pip install -r requirements.txt
# ADD . /my_app_dir/
