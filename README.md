## AB300-AI-models
* [Prepare AB300](#ab300_setup)
* [reference](#reference)

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

https://developer.qualcomm.com/forum/qdevnet-forums/computer-vision-fastcv/7556  - qcom build issues
https://colab.research.google.com/drive/1Y7hjXPiTgkO7tsgG2xGbWVlMTNmUTh6A#scrollTo=ArMQB8cbHf_Q&uniqifier=1   = onnx usage on colab
