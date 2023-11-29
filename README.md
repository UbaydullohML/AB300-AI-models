## AB300-AI-models
* [Prepare AB300](#ab300_setup)


## AB300_setup
Task:
- Setup board
  
![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/d2106ab6-ae2f-4d8a-92bd-f267509e077c)

in order to take stream of camera we need create a file which includes below code, code file will be provided

    vi postrouting.sh # input the codes like below image
    # :wq
    chmod +x postrouting.sh
    ./postrouting.sh

after running the code we let the rtsp tcp and udp address send and allow to otu 554 port on other device which we intend to use.

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/6b22c8c9-c70d-452e-b097-da8dbb3ef5d9)


on the postrouting.sh code we need to change 4 lines in order to change to another camera or in the beginning:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/7e3e4c3e-d510-4c77-bd51-e6cd6e79cf0a)

this is a range we set which will be around 100, and 192.168.144, the 144 is related to camera stream rtsp

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/e75122d2-76a7-4d89-82fd-7bc44d4afc28)

here it is prerouting the stream rtsp to dport 554, so we need to change to 192.168.144.25:8554 (to the camera which we are using)

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/f5ef1bf3-8533-48da-8ce1-c185a1421d2e)

here we change that to 192.168.144.25, which is camera rtsp ip.

full code in below:

![image](https://github.com/UbaydullohML/AB300-AI-models/assets/75980506/0ca41fb7-432d-4075-a4b9-e87b3099c8b5)




- connect camera

