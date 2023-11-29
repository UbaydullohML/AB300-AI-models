## Table of Contents
* [Set up Python3.8 env](#set_pythonEnv)
* [Install Yolov7](#install_yolov7)
* [Install requirements](#install_requirements)
* [Run Model](#run_model)
* [Dev](#dev)


## Set_pythonEnv
- install python3.8 in Ubuntu 18.04

You can install Python 3.8 on Ubuntu 18.04 by using a third-party repository like Deadsnakes. Follow these steps:
    
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update

    sudo apt install python3.8
    sudo apt-get install python3.8-venv
    
    python3.8 -m venv myenv   # Replace 'myenv' with your preferred environment name
    source myenv/bin/activate   # read and run 'activate' script

source myenv/bin/activate, you are telling the shell to read and run the commands within the activate script located in the myenv/bin directory.

Now, you are working within the myenv virtual environment with Python 3.8. Install packages as needed using pip:

    pip install <package>
    deactivate


## Install_yolov7 

    git clone https://github.com/WongKinYiu/yolov7
    cd yolov7
    # navigate to yolov7 directory and checkout u7 branch of YOLOv7 - this is hash of latest commit from u7 branch as of 12/21/2022
    git checkout 44f30af0daccb1a3baecc5d80eae22948516c579      
    cd seg


## Install_requirements

and there we upgrade the pip
and install requirements of yolov7

    pip install --upgrade pip
    pip install -r requirements.txt
    
- in case an error comes and indicates that the installation of the psutil package failed because it couldn't find the necessary Python header files required for building the package from the source.

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/939a705f-c1b2-4d47-a4a3-56297013e98e)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/8277fe62-62a6-47a2-aafe-2c607c80127b)

The error message indicates that the installation of the psutil package failed because it couldn't find the necessary Python header files required for building the package from the source.
This command installs the necessary C compiler (gcc) and Python development headers (python3.8-dev) required to build Python packages that have C extensions.

To fix an issue we installed gcc python3.9-dev

    sudo apt-get install gcc python3.8-dev

Try below again

    pip install --upgrade pip
    pip install -r requirements.txt


![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/f22f8f02-a275-406f-bad7-2cf1f351c0ff)

Env is set up.



## Run_model
download COCO starting checkpoint to yolov7/seg directory

    wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7-seg.pt
    # WEIGHTS_PATH = f"{HOME}/yolov7/seg/yolov7-seg.pt"

download example image

    wget 'https://docs.google.com/uc?export=download&id=1sPYHUcIW48sJ67kh5MHOI3GfoXlYNOfJ' -O dog.jpeg
    IMAGE_PATH = f"{HOME}/yolov7/seg/dog.jpeg"

run model 

    python segment/predict.py --source dog.jpeg --weights yolov7-seg.pt
    python segment/predict.py --source dog.jpeg --weights yolov7-seg.pt --name coco

image outputs

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/773c017a-2ffa-49cc-9087-392fc87dc98c)
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/ec87b31c-e4ac-4157-a678-24bdca57cb6b)

video outputs:

stream outputs:
