### Set the following paths to point to the respective packages.
SSROOTDIR=/Volumes/Network/courses/ss/
FROOTDIR=/Volumes/Network/courses/ss/festival/festival_linux

EST_PYTHON=$FROOTDIR/python3.6/site-packages/
PYTHONPATH=$EST_PYTHON:$PYTHONPATH
ESTDIR=$FROOTDIR/speech_tools
MBDIR=$FROOTDIR/multisyn_build
LDLIBS=$ESTDIR/lib

FESTIVALDIR=$FROOTDIR/festival
FESTVOXDIR=$FROOTDIR/festvox


### Set LD_LIBRARY_PATH for python and FESTVOX scripts.
if [ "$LD_LIBRARY_PATH" ] ; then
    LD_LIBRARY_PATH=$LDLIBS:$LD_LIBRARY_PATH
else
    LD_LIBRARY_PATH=$LDLIBS
fi

FESTIVAL=$FESTIVALDIR/bin/festival
PATH=$MBDIR/bin:$FESTVOXDIR/src/general:$SSROOTDIR:$ESTDIR/bin:$FESTIVALDIR/bin:$PATH


export ESTDIR FESTIVAL FESTVOXDIR LD_LIBRARY_PATH PATH FROOTDIR SSROOTDIR MBDIR PYTHONPATH EST_PYTHON

export VERSIONER_PYTHON_PREFER_32_BIT=yes
