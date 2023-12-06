## Table of Contents:
* [Yolo7det](#yolo7det)
* 


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
