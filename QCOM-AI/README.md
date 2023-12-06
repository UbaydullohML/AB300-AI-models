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
- 
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
