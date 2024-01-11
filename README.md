## AB300-AI-models
* [Prepare AB300](#ab300_setup)
* [reference](#reference)
* [qtimletflite](#qtimletflite)

## AB300_setup   
Task: 
- Setup board
  
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/d2106ab6-ae2f-4d8a-92bd-f267509e077c)

to take a stream of the camera we need to create a file that includes the below code file will be provided.

    vi postrouting.sh # input the code file 
    # :wq

we need to install iptables to use the code

    sudo apt-get install iptables


After running the code we let the rtsp TCP and udp address send and allow to 554 port on other device that we intend to use.

Camera rtsp data

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/6b22c8c9-c70d-452e-b097-da8dbb3ef5d9)

on the postrouting.sh code, we need to change four lines to change to another camera or in the beginning:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/7e3e4c3e-d510-4c77-bd51-e6cd6e79cf0a)

this is a range we set, which will be around 100 and 192.168.144; the 144 is related to camera stream RTSP

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/e75122d2-76a7-4d89-82fd-7bc44d4afc28)

here, it is prerouting the stream rtsp to dport 554, so we need to change to 192.168.144.25:8554 (to the camera that we are using)

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/f5ef1bf3-8533-48da-8ce1-c185a1421d2e)

Here, we change that to 192.168.144.25, which is camera rtsp ip.


Full code in below:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/0ca41fb7-432d-4075-a4b9-e87b3099c8b5)

    chmod +x postrouting.sh
    ./postrouting.sh

- connect camera
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/bf1aa7be-d661-4ef4-8e23-5fcc25dd30ea)

- open in vlc
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/161b0274-2e53-46c3-83a4-590ca5eb5577)

to open the stream on our vlc, we use the eth1 which is the static ip address of board as below

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/3e2dfaea-719a-4cbb-8cd8-4f67920a56e3)

rtsp://192.168.0.38:554/main.264, the ip address is of ab300 board


## Reference
necessary libraries of android for qcom snpe:

https://android.googlesource.com/platform/frameworks/native/+/android-4.2.2_r1/include/utils/

https://android.googlesource.com/platform/system/core/+/refs/heads/main/libcutils/include/cutils/log.h

https://android.googlesource.com/platform/system/core/+/master/libcutils/include/cutils/properties.h

https://github.com/jungin500/snpe-docker    - snpe docker

https://developer.qualcomm.com/forum/qdevnet-forums/computer-vision-fastcv/7556  - qcom build issues

https://colab.research.google.com/drive/1Y7hjXPiTgkO7tsgG2xGbWVlMTNmUTh6A#scrollTo=ArMQB8cbHf_Q&uniqifier=1   = onnx usage on colab

https://mpolinowski.github.io/docs/IoT-and-Machine-Learning/ML/2023-01-14-yolov7_to_tensorflow/2023-01-14/  - onnx to tflite

https://igor.technology/export-yolo-v7-to-tensorflow-lite/     = onnx-to-tflite

https://github.com/VikasOjha666/yolov7_to_tflite/blob/main/yoloV7_to_TFlite%20.ipynb   = onnx-tflite

https://github.com/sithu31296/PyTorch-ONNX-TFLite    = pt - onnx - tflite

## Qtimletflite

- the default detect.tflite is working and files are being organized in like below yolo folder

all the below ouptuts are default object detection results in qcom real time streaming

and it has reached 30 + frame per second

in below yolo folder there is and .tflite weight, label file and .config file to be used in code

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/5e3f8a27-c19e-4304-ab6b-6bebd2b7ebe0)

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/998246ab-4127-4150-9dc1-2cf05b232578)

    gst-launch-1.0 qtiqmmfsrc ! video/x-raw\(memory:GBM\), format=NV12, width=1280, height=720, framerate=30/1 ! queue ! qtimletflite config=/data/misc/camera/yolo/mle_tflite.config 
    postprocessing=detection ! queue ! qtioverlay ! waylandsink  width=1920 height=1080 async=true sync=false enable-last-sample=false

- qtimletflite is working as above code

this one is the qcom rb5 camera input

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/4eee223a-5d61-4ddf-b000-9cb748b5ccd6)

and output

    gst-launch-1.0 rtspsrc location=rtsp://192.168.0.38:554/live ! decodebin ! videoconvert ! qtimletflite config=/data/misc/camera/yolo/mle_tflite.config
    postprocessing=detection ! queue ! qtioverlay ! waylandsink width=1920 height=1080 sync=true enable-last-sample=false

and this one is ab300 camera rtsp://192.168.0.38 stream input

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/339b8f7e-80e7-4271-832f-af1ddd19f2ac)

and output


- bugs related links (onnx-tensorflow, )
  
https://github.com/onnx/onnx-tensorflow
https://github.com/onnx/onnx-tensorflow/issues?q=is%3Aissue+is%3Aopen+Transpose
https://github.com/onnx/onnx-tensorflow/issues/310     (NCHW" but tensorflow data type is "NHWC")
https://github.com/onnx/onnx-tensorflow/issues/912      onnx（nchw）>> tf.pb(nchw)
https://github.com/PINTO0309/PINTO_model_zoo/issues/15    Is there an easy way to convert ONNX or PB from (NCHW) to (NHWC)?
https://console.paperspace.com/github/gradient-ai/yolov5/blob/master/tutorial-paperspace.ipynb?machine=Free-GPU&file=%2F.pre-commit-config.yaml
https://stackoverflow.com/questions/63880242/trying-to-convert-onnx-model-to-pb-model-using-onnx-tf-library

