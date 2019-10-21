#lang racket

(require modulate/lilypond_mod)
(require csd/music_transforms)
(require modulate/modulate)

; define ingredients (rhythm in 1s, melody, new mode)
(define melody '(f g a bes c a b a g a e e f g a g a b c d a g f e d f f g a c b a b b g a g f a bes a f g f e e d d e f e f g a c a d c d a a bes a g f g f e f g a c a g a e f e d))
(define rhythm (for/list ([i (in-range (length melody))]) 4))
(define mode "f")
(define assignment "ModulateTest")

; run the functions
(define conversion (transpose-phrase (make-phrase (notes-to-numbers (melody-modulate melody mode)) rhythm) 48))
(define filename (string-append assignment (string-upcase mode) ".ly"))

; write to lilypond
(lilypond-open filename)
(lilypond-clef "baritone")
(lilypond-composer "D. Kamp")
(lilypond-write conversion)
(lilypond-close)