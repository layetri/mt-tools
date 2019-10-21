#lang racket

(provide melody-modulate)

;finds the mode of the current melody
(define (find-modus melody) (
                                ;takes the last note in the melody
                                last melody
                                     ))

;helper function: provides substitution functionality
(define (subst fsym tsym lst)
    (cond
        [(null? lst) lst]
        [(eq? (first lst) fsym) (cons tsym (subst fsym tsym (rest lst)))]
        [else (cons (first lst)(subst fsym tsym (rest lst)))]
        )
    )

;defines the four Gregorian modes
(define modes (make-hash))
(hash-set! modes "d" '(d e f g a b c))
(hash-set! modes "e" '(e f g a b c d))
(hash-set! modes "f" '(f g a b c d e))
(hash-set! modes "g" '(g a b c d e f))


; Modulate a given phrase to a given mode
; For example (phrase-modulate '(e f g f) e)
(define (melody-modulate melody mode)
    (cond (not (equal? mode (symbol->string (find-modus melody)))
               (begin
                   ;substitutes Bb for B to avoid confusion
                   (subst '(bes) '(b) melody)

                   ;finds the current scale of the melody
                   (define scale (hash-ref modes (symbol->string (find-modus melody))))

                   ; for each note in melody
                   (for/list ([i (in-range (length melody))])
                             (begin
                                 ;find the index within the current scale
                                 (define position (index-of scale (list-ref melody i)))

                                 ;find note in new scale at given index
                                 (list-ref (hash-ref modes mode) position)
                                 )
                             )
                   )
               )
          )
    )