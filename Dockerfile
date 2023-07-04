# pull official base image
FROM python:3.10
# FROM pytorch/torchserve
# RUN pip install --upgrade pip
RUN apt update && apt-get update
RUN apt install curl

ENV PYTHONUNBUFFERED 1
# RUN mkdir /my_app_dir
WORKDIR /home/model-server

ADD . /home/model-server
# RUN cd ..
# RUN cd ..
# RUN cd /my_app_dir
# RUN touch my_app_dir.txt
RUN mkdir -p /model_store
RUN pip install torchserve torch-model-archiver torch-workflow-archiver
# CMD "torch-model-archiver", "--model-name", "fcn_resnet_101", "--version", "1.0", "--model-file", "image_segmenter/fcn/model.py", "--serialized-file", "fcn_resnet101_coco-7ecb50ca.pth", "--handler", "image_segmenter", "--extra-files", "image_segmenter/fcn/fcn.py,image_segmenter/fcn/intermediate_layer_getter.py"
RUN torch-model-archiver --model-name fcn_resnet_101 --version 1.0 --model-file image_segmenter/fcn/model.py --serialized-file fcn_resnet101_coco-7ecb50ca.pth --handler image_segmenter --extra-files image_segmenter/fcn/fcn.py,image_segmenter/fcn/intermediate_layer_getter.py
RUN mv fcn_resnet_101.mar /model-store

# CMD [ "torchserve", "--start", "--model-store", "model-store", "--models", "my_model_name=my_model_name.mar" ] 


# ADD requirements.txt /my_app_dir/
# RUN pip install -r requirements.txt
# ADD . /my_app_dir/

# curl http://127.0.0.1:8080/predictions/fcn -T image_segmenter/persons.jpg