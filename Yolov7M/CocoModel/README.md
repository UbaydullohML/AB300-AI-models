## Table of Contents:
* [Before Start](#before_start)
* [Install YOLOv7](#install_yolo7)
* [Install requirements](#install_requirements)
* [Pre-trained Coco Model](#pre-trained_cocoModel)
* [Stream 24](#stream_pc)
* [Stream_28](#stream28_pc)
* [rtsp Output PC](#rtsp_output_pc)
* [rtsp_output SOM](#rtsp_output_som)
* [Yolo_det](#yolo_det)

## Before_Start
- Let's make sure that we have access to GPU. We can use `nvidia-smi` command to do that. In case of any problems navigate to `Edit` -> `Notebook settings` -> `Hardware accelerator` and set it to `GPU`.

      nvidia-smi

- and create an environment:
- with python 3.8 version

https://github.com/UbaydullohML/windows1/blob/main/env_create.md

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/ddff19f5-f6ab-4812-ae6a-0af53a83f0d3)

## Install_YOLO7

      git clone https://github.com/WongKinYiu/yolov7
      // navigate to yolov7 directory and checkout u7 branch of YOLOv7 - this is hash of lates commit from u7 branch as of 12/21/2022
      git checkout 44f30af0daccb1a3baecc5d80eae22948516c579


## Install_Requirements
- code run is done inside seg folder of u7 branch of YOLOv7

      pip install --upgrade pip
      pip install -r requirements.txt

## Pre-trained_CocoModel

- download COCO starting checkpoint to yolov7/seg directory

      wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7-seg.pt
      # WEIGHTS_PATH = f"{HOME}/yolov7/seg/yolov7-seg.pt"

- download the example image

      wget 'https://docs.google.com/uc?export=download&id=1sPYHUcIW48sJ67kh5MHOI3GfoXlYNOfJ' -O dog.jpeg
      IMAGE_PATH = f"{HOME}/yolov7/seg/dog.jpeg"

- run code inside seg folder:

      python segment/predict.py --source dog.jpeg --weights yolov7-seg.pt --name coco
      python segment/predict.py --source dog.jpeg --weights yolov7-seg.pt
      python segment/predict.py --source data/cars1.mp4 --weights yolov7-seg.pt
      python segment/predict.py --source data/cars2.mp4 --weights yolov7-seg.pt
      python segment/predict.py --source data/frame_0124.jpg --weights yolov7-seg.pt

- to see the outuput inside the vscode:

      import os
      HOME = os.getcwd()
      print(HOME)
      RESULT_IMAGE_PATH = f"{HOME}/yolov7/seg/runs/predict-seg/coco/dog.jpeg"
      from IPython.display import Image, display
      display(Image(filename=RESULT_IMAGE_PATH))
      
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/9e055f7a-1f4b-4d38-8adb-b8fe8a225f14)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/1c4614f4-2fd9-49d6-b339-385166af8aec)


## Stream_pc

Task:
- as Yolo mainly saves the input video in its folder
- which i have written stream.py file based on Yolov7 predict.py in order to stream input file

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/99f9f121-50a4-47c1-b9f1-6fe523b7e49b)

- now i have changed the code like below, to stream it on the new window


     

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/22319dda-a576-4bbc-8f2a-b052061369ba)


- streaming output on pc window:
- which i have written stream.py file based on Yolov7 predict.py in order to stream input file

stream.py

      python segment/stream.py --source data/cars2.mp4 --weights yolov7-seg.pt --view-img
      python segment/stream.py --source data/s5s.mp4 --weights yolov7-seg.pt

- output streaming results:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/48b03313-1629-40eb-8914-1b15297342fa)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/0f867f74-20ea-4d8a-811c-afa25a91097b)


## Stream28-pc
Task:
- code below part is edited in sream.py
  
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/43b7a5e7-b12a-4058-bda9-7b0609d75553)

- and in order to use the code in terminal we run below codes and rtsp is also working like below in PC:

      python segment/stream.py --source rtsp://192.168.0.38:554/main.264 --weights yolov7-seg.pt
      
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/f2cf16b0-027c-4071-8986-7a0a82b1a155)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/e9d8c249-7d29-41ff-ab78-b0422e241fc9)





## Yolo_Det

- installed python venv 3.8

      python detect.py --source data/dog.jpeg --weights yolov7.pt

installing the onnx grapsurgeon

      python3 -m pip install onnx_graphsurgeon --index-url https://pypi.ngc.nvidia.com
