#ARCH		:= mips

ifeq ($(ARCH),mips)
CROSSTOOLDIR				:=/opt/au/qsdk-dusun/qsdk
export	STAGING_DIR	:= $(CROSSTOOLDIR)/staging_dir
export	PATH				:=$(PATH):$(STAGING_DIR)/toolchain-mips_34kc_gcc-4.8-linaro_uClibc-1.0.14/bin
CROSS_CFLAGS				:= -I$(CROSSTOOLDIR)/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_uClibc-1.0.14/usr/include
CROSS_LDFLAGS				:= -L$(CROSSTOOLDIR)/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_uClibc-1.0.14/usr/lib
CROSS								:= mips-openwrt-linux-
endif

GCC 		:= $(CROSS)gcc
CXX			:= $(CROSS)g++
AR			:= $(CROSS)ar
AS			:= $(CROSS)gcc
RANLIB	:= $(CROSS)ranlib
STRIP 	:= $(CROSS)strip
OBJCOPY	:= $(CROSS)objcopy
OBJDUMP := $(CROSS)objdump
SIZE		:= $(CROSS)size
LD			:= $(CROSS)ld
MKDIR		:= mkdir -p

CFLAGS							:= -Wall -g -O2 -I$(ROOTDIR)/libs/osi/include  -I$(ROOTDIR)/libs/other/include 
CFLAGS							+= -I$(ROOTDIR)/libs/third/json/include -DHAVE_CONFIG_H -DHAVE_STDINT_H
CFLAGS							+= -I$(ROOTDIR)/libs/third/libhttpd/include
CFLAGS							+= -fPIC
CFLAGS							+= -fpermissive
CXXFLAGS						:= -std=c++0x 
CXXFLAGS						+= $(CFLAGS)
TARGET_CFLAGS				+= $(CROSS_CFLAGS) 


LDFLAGS							:= -L$(ROOTDIR)/lib -lm -lrt -ldl -lpthread
LDFLAGS							+= -lstdc++
TARGET_LDFLAGS			+= $(CROSS_LDFLAGS)
