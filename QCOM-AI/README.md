## Table

* [Set Env](#set_env)
* [example](#example)


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


## Example
