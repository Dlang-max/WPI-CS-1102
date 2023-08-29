;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |CS 1102 Optional data-definition videos|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data Definition:
;; non-distinct data

;;Cities

;; Information: atomic can't be taken apart into more meaningful information
;; Buffalo

;; Boston

;; CityName is String
;; interp. the name of a city

(define CN1 "Boston")
(define CN2 "Buffalo")
#;
(define (fn-for-city-name city-name)
  (... city-name))

;; Template rules for
;; - atomic non-distic: String

;_________________________________________________________________________________

;; CityName -> Boolean
;; produce true if the gien city is Buffalo, false otherwise

(check-expect (best? "Buffalo") true)
(check-expect (best? "Boston") false)

;(define (best? city-name) false)

;; took template from CityName

#;
(define (best? city-name)
  (if(string=? city-name "Buffalo")
     true
     false))

(define (best? city-name)
  (string=? city-name "Buffalo"))

;______________________________________________________________________________

;; Intervals

;; SeatNum is Natural[1, 32]
;; interp. seat numbers in a row, 1 and 32 are aisle seats -> What does data mean

(define SN1 1) ;aisle
(define SN2 32) ;aisle
(define SN3 4) ;in middle

(define (fn-for-seat-num sn)
  (... sn))

;; Template rules used:
;; -atomic non-distinct: Natural[1, 32]

;_________________________________________________________________________________

; Functions

;; LetterGrade -> LetterGrade

;; priduce next highest letter grade (no change for A)

(check-expect (bump-up "A") "A")
(check-expect (bump-up "B") "A")
(check-expect (bump-up "C") "B")

;(define (bump-up grade) "A")


(define (bump-up grade)
  (cond[(string=? grade "A") "A"]
       [(string=? grade "B") "A"]
       [(string=? grade "C") "B"]))


;________________________________________________________________________________

;; Data Definition Practice

; GPA and academic standing

;; GPA is Number [4.0, 0.0]
;; interp. GPA of a student in college


;; GPA -> String
;; input GPA and output string related to academic standing

(define GPA1 3.6)
(define GPA2 2.0)

(define (fn-for-gpa gpa)
  (... gpa))

(define (academic-standing gpa)
  (cond [(> gpa 3.5) "good"]
        [(< gpa 2.0) "failing"]
        [else "Satisfactory"]))


; Template rules
; -atomic non-distinct: Number



