## Table of Contents:
* [Before Start](#before_start)
* [Install YOLOv7](#install_yolo7)
* [Install requirements](#install_requirements)
* [Pre-trained Coco Model](#pretrained_cocoModel)

## Before_Start
- Let's make sure that we have access to GPU. We can use `nvidia-smi` command to do that. In case of any problems navigate to `Edit` -> `Notebook settings` -> `Hardware accelerator` and set it to `GPU`.

      nvidia-smi

- and create an environment:
- with python 3.8 version

https://github.com/UbaydullohML/windows1/blob/main/env_create.md

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/ddff19f5-f6ab-4812-ae6a-0af53a83f0d3)

## Install_YOLOv7

      git clone https://github.com/WongKinYiu/yolov7
      // navigate to yolov7 directory and checkout u7 branch of YOLOv7 - this is hash of lates commit from u7 branch as of 12/21/2022
      git checkout 44f30af0daccb1a3baecc5d80eae22948516c579


## Install_Requirements
- code run is done inside seg folder of u7 branch of YOLOv7

      pip install --upgrade pip
      pip install -r requirements.txt

## Pretrained_CocoModels

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



      
      
