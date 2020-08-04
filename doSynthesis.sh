#!/bin/bash

# set which version of festival you want to use (defaults to whatever is on your path)
FESTIVAL=`which festival`
FESTIVAL=/Volumes/Network/courses/ss/festival/festival_linux/festival/bin/festival

# we then just run festival in "-b" batch mode to evaluate the commands in the given
# scheme list that follows  - any additional scheme commands can be put in the list...
$FESTIVAL -b '(list 
     (voice_localdir_multisyn-gam) ; choose your voice here
     (Param.set "Synth_Method" "None") ; disables waveform generation for speed (comment out if you want that - see below)
     (set! tts_hooks (list utt.synth)) 
     (load "./synthAndSaveSentences.scm")
     ;(SynthAndSaveSentences "./many_sentences.txt" "./") ; can save utterance structures, relations, waveforms etc...
     (SynthAndFlatPrintSentences "./many_sentences.txt") )'

