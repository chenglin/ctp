#
# makefile
#
# ****

include ../build/config.env
include ../build/config/$(BASIC_CONFIG)


EXENAME = testTrader


OBJS32 = ./src/TraderSpi.o32 ./src/testTraderApi.o32

OBJS64 = ./src/TraderSpi.o64 ./src/testTraderApi.o64


CCFLAGS =-I./src \
	-I../include


LDFLAGS =-L../lib -lthosttraderapi  \


include ../build/rules/exebuild
