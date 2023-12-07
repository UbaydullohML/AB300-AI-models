## Table

* [Set Env](#set_env)
* [SNPE](#snpe)
* [onnx](#onnx)
* [DLC](#dlc)


## Set_Env

Task:
- creating the setupai.sh file

      vi setupai.sh

- inserting the data


       #!/bin/bash
       export SNPE_TARGET_ARCH=aarch64-ubuntu-gcc7.5
       export LD_LIBRARY_PATH=/data/local/tmp/snpeexample/$SNPE_TARGET_ARCH/lib
       export PATH=$PATH:/data/local/tmp/snpeexample/$SNPE_TARGET_ARCH/bin
       export ADSP_LIBRARY_PATH="/data/local/tmp/snpeexample/dsp/lib;/system/lib/rfsa/adsp;/system/vendor/lib/rfsa/adsp;/dsp"
       export XDG_RUNTIME_DIR="/usr/bin/weston_socket"
   
       mkdir -p $XDG_RUNTIME_DIR
       chmod 0700 $XDG_RUNTIME_DIR

-    chmod +x setupai.sh

- and in order to make env the script globally. Another approach is to modify the user's profile configuration file (e.g., ~/.bashrc for bash shell) to automatically run the script and set the environment variables whenever a new shell session is started. This way, the environment variables will be set for every new session for that user.

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/8c8adde4-145b-460c-a940-18803ab510ce)

- or
  
      source setupai.sh

- for checking the env outputs with below codes:

      echo $SNPE_TARGET_ARCH
      echo $LD_LIBRARY_PATH
      echo $PATH
      echo $ADSP_LIBRARY_PATH
      echo $XDG_RUNTIME_DIR
  
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/0fd59a55-5e75-4a6e-8f63-5d82b4f67f63)


- in order to set firefox and chrome, below link will be helpful:
https://developer.qualcomm.com/forum/qdn-forums/hardware/qualcomm-robotics-rb5-development-kit/68570

      firefox

and chrome

      chromium-browser --no-sandbox
      DISPLAY=:0 chromium-browser --no-sandbox


## Snpe

- SDK 

https://developer.qualcomm.com/software/qualcomm-ai-engine-direct-sdk?cmpid=pr-glQvK2skeT

The Qualcomm® AI Engine Direct SDK provides lower-level, unified APIs for AI development.
A processor SDK, or software development kit, is a collection of tools and software that allows developers to create applications for a specific processor. 

benefits:
1. reduce development time, by providing pre built set of tools and software
2. improve code quality,
3. reduce risk, support and resources from processor manufacturer. 

- Task:

usage and role of qcom SDK for neural processing:
as before I have used the PyTorch method to get the below weight yolov7.pt
and was able to export to .onnx weight as well

which is not directly focused on qcom engine, it was suitable more for gpu-based systems.
thus, now we need to use qcom sdk to make it effective with qcom engine (CPU/GPU).

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/cbd53f7d-b327-4c42-83bd-4a10155627f2)

qcom sdk-based weight is used by Qualcomm Technologies, Inc. (QTI) within the SDK
weights which are third-party frameworks such as TensorFlow Lite and the ONNX runtime could be used as well.


- SDKs:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/1d10de03-5044-42e4-8e5c-88c41e75fc79)
https://www.qualcomm.com/developer/artificial-intelligence#overview

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/072d823e-db5a-4768-82bc-36de9dbc94e3)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/838097f1-9f2e-4c15-bee1-f9ca3f5b9fd1)


SDK usage in snpe of SOM
Network is designed and trained using familiar frameworks: TensorFlow, PyTorch, Keras and ONNX
and changed to dlc format

Development Forkflow:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/5fe16e5b-bf1e-4c73-9962-c69b03a6e1f3)

model file is converted into .dlc (Deep Learning Container) file to be used by Snapdragon Neural Processing Engine (NPE) runtime.


## ONNX
- concept of ONNX (Open Neural Network Exchange), ai ecosystem,
ONNX is designed to allow framework interoperability
There are many excellent machine learning libraries, such as PyTorch TensorFlow, MXNet, Caffe, etc.
the idea is to use a model with one tool stack and deploy it using another for inference and prediction.
to ensure this interoperability, we must export the model into the model.onnx

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/cfdb084e-f66d-4662-8e82-6784e57f037d)

- model.onnx format is serialized representation of model in protobuf file. 
and there is an native support in onnx for pytorch, cntk, mxnet and caffe2. 
but there are also converters for Tensorflow and CoreML


- Example ONNX usage case:
first there is an trained model
second we want to deploy it to new IOS app, 
we trained the model with CNN in PyTorch but IOS expect to use CoreML to be used in the app. 
ONNX is intermediary representation of model that let easily go from on environment to the next. 
