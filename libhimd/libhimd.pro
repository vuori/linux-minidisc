TEMPLATE=lib
TARGET  =himd
CONFIG -= qt
CONFIG += staticlib link_pkgconfig create_prl console debug_and_release_target

!without_mcrypt: {
  LIBS += -lmcrypt
  DEFINES += CONFIG_WITH_MCRYPT
}
else: !build_pass: message(You disabled mcrypt: No PCM transfer will be supported)

!without_mad: {
  LIBS += -lmad
  DEFINED += CONFIG_WITH_MAD
}
else: !build_pass: message(You disabled with_mad: No MP3 transfer will be supported)

PKGCONFIG += glib-2.0
HEADERS += himd.h himd_private.h
SOURCES += encryption.c himd.c mdstream.c trackindex.c
LIBS    += -lmad -lmcrypt