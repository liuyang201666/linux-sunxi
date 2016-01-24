#!/bin/bash
MarsBoard_TARGET_DIR=${PWD}/arch/arm/boot/modules
#echo "MarsBoard_TARGET_DIR = ${MarsBoard_TARGET_DIR}"
echo "Start build uImage ......................."
make  uImage 
if [ $? -eq 0 ]
then
echo "build uImage success......................."
else
echo "build uImage failed........................"
exit 0
fi
echo "Start build modules ......................."
make  modules
if [ $? -eq 0 ]
then
echo "build modules success......................."
else
echo "build modules failed........................"
exit 0
fi

if [ ! -d ${MarsBoard_TARGET_DIR} ]; then
	echo "creat dir : ${MarsBoard_TARGET_DIR}"
        mkdir -pv ${MarsBoard_TARGET_DIR}
fi

echo "Start build modules_install ......................."
make   INSTALL_MOD_PATH=${MarsBoard_TARGET_DIR} modules_install
if [ $? -eq 0 ]
then
echo "build modules_install success......................."
else
echo "build modules_install failed........................"
exit 0
fi

exit 0

