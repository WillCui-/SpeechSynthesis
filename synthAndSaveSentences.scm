;; A model for how to automate large scale synthesis-and-save
;; AUTHOR: Korin Richmond (korin@cstr.ed.ac.uk)
;; DATE: 09/02/2018
;;
;; (based on a script originally from 14.03.2004, also by Korin)

(defvar globalUttNum 0)
(defvar globalSaveDir "./") ; just defaults - can be overriden further on

(define (myAfterSynthSave utt)
  (set! uttfilename (format nil "utt%.8d.utt" globalUttNum))
  (utt.save utt (path-append globalSaveDir uttfilename)) ; save the utterance structure

  ;; or just selected relation(s) 
  ; (set! segfilename (format nil "utt%.4d.segs" globalUttNum))
  ; (utt.save.relation utt "Segment" (path-append globalSaveDir segfilename) 1)

  ;; and/or the waveform...
  ; (set! wavfilename (format nil "utt%.4d.wav" globalUttNum))
  ; (utt.save.wave utt (path-append globalSaveDir wavfilename))
  (set! globalUttNum (+ globalUttNum 1)))

(define (myAfterSynthFlatPrint utt)
  (format t "utt%.8d %s\n" globalUttNum (utt.flat_repr utt)) ; convert utterance structure to flat text repr and print 
  (set! globalUttNum (+ globalUttNum 1)))

(define (SynthAndSaveSentences text savedir)
  "(SynthAndSaveSentences TEXTFILE SAVEDIR)
Run Festival on the sentences found in TEXTFILE, saving selected 
results of synthesis in corresponding files in directory SAVEDIR"
  (set! globalUttNum 1)
  (set!	globalSaveDir savedir)
  (set! after_synth_hooks myAfterSynthSave)
  (tts_file text)
  (set! after_synth_hooks nil))

(define (SynthAndFlatPrintSentences text)
  "(SynthAndFlatPrintSentences TEXTFILE)
Run Festival on the sentences found in TEXTFILE, then convert the linguistic
data structures resulting from front-end analysis to a flat string 
representation, which is then printed to standard out."
  (set! globalUttNum 1)
  (set! after_synth_hooks myAfterSynthFlatPrint)
  (tts_file text)
  (set! after_synth_hooks nil))
