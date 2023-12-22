## Table of Contents:
* [Yolo7det](#yolo7det)
* [Convert onnx to tflite](#convert_onnx_to_tflite)


## Yolo7det

Task:
- optimized code with inputting 'CPU'
- 
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/ceba2d27-a521-4d03-b811-f196df1a95e9)


- used the detection model instead of segmentation
where as we can see below output, the detection is high quality, and the fps reach around two speed,
which last time segmentation was coloring the objects to the class color, and it was lower quality of image and much slower
now it is around 5x improved in performance in Qcom Som

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/55e7d42e-c1a0-45b5-a7a1-3527f1b63dd7)

usage of smaller weight as like before CPU usage

- Plan:

use the detection and smaller weight with snpe of qcom
and use onnx and dlc together

    python detect.py --source data/s5s.mp4 --weights yolov7-tiny.pt

- the installation of yolov7 det and testing are available in yolotest.ipynb fie

- below is done to not save and directly stream video:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/3966c505-7e5b-4f9c-a795-258637ff398f)


- and this font_size=1.0 has been added to increase the size of bounding box and class font size

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/2c9befab-a26c-4900-9af1-402b4251d4b8)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/94780c7d-d8e4-4dbe-9d4e-3eb85c74a3d4)

## Convert_onnx_to_tflite

- following the below link to change onnc to tflite and inference.
https://mpolinowski.github.io/docs/IoT-and-Machine-Learning/ML/2023-01-14-yolov7_to_tensorflow/2023-01-14/

in windows powershell env, using 
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/7c28332b-c333-4afa-bda9-c3d04e45bae2)

environment activateing using below method

    .\yolo78\Scripts\activate
    
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/7a1490b9-007b-4900-9830-5f906dce2fc5)


changing .pt to onnx like below

    python export.py --weights yolov7-tiny.pt --grid --end2end --simplify --topk-all 100 --iou-thres 0.65 --conf-thres 0.35 --img-size 640 640 --max-wh 640

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/6b7c3516-5834-4af3-afb4-76a4ab2324ee)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/5df8a0d1-bd6f-43df-8612-b1769163d780)

install following library

    pip install onnx-tf tensorflow-probability
    pip install --upgrade tensorflow 
    python -c "import tensorflow as tf; print(tf.__version__)"

where tensorflow probability requires tensorflow >= 2.13

Converting onnx to tf which is .pb

    onnx-tf convert -i yolov7-tinyy.onnx -o weights

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/4133b519-15ee-4f96-ae1c-e5fc170240e6)

used the tf_to_tflite.py file in above

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/405317b5-7750-4e81-8a65-3fcac3dbee6d)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/2af6971d-7d67-4673-8fd0-91853e2fa884)


inference output:

using tflite_predctions.py file

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/a009a93a-b7b2-463c-9e55-b31c20699f73)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/78a04cdb-e8e3-49c7-ac8e-81f5796f0adb)



