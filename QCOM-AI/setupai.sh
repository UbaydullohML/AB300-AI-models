   #!/bin/bash
   export SNPE_TARGET_ARCH=aarch64-ubuntu-gcc7.5
   export LD_LIBRARY_PATH=/data/local/tmp/snpeexample/$SNPE_TARGET_ARCH/lib
   export PATH=$PATH:/data/local/tmp/snpeexample/$SNPE_TARGET_ARCH/bin
   export ADSP_LIBRARY_PATH="/data/local/tmp/snpeexample/dsp/lib;/system/lib/rfsa/adsp;/system/vendor/lib/rfsa/adsp;/dsp"
   export XDG_RUNTIME_DIR="/usr/bin/weston_socket"
   
   mkdir -p $XDG_RUNTIME_DIR
   chmod 0700 $XDG_RUNTIME_DIR
