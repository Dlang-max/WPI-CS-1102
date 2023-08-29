;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |CS 1102 HtDF and data-definitions notes|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; Problem: Find the area of a square given the length of one of its sides


;; Signature:
;; number -> number

;; Purpose:
;; Find the area of a square given the length of its sides

;; Stub:
;(define (find-area length) 0)
;
;; Example:
(check-expect (find-area 4) 16)
;
;: Template:
;(define (find-area length)
;  (...length))

;;Function:
(define (find-area length)
  (* length length))
;________________________________________________________

;; Problem: consume an image and find its area

;; Signature
;; Pixels are natural meaing out put will also be
;; image -> natural


;; Purpose:
;; Takes in an image and finds the area of that image

;; Stub:
;(define (image-area image) 0)


;;Examples:
(check-expect (image-area (square 5 "solid" "red")) 25)
;; Template:
;(define (image-area image)
  ;(...image))

;; Function:
(define (image-area image)
  (* (image-width image) (image-height image)))

;_______________________________________________________

;; Problem: consume an image and determine if it is tall

;;Signature:
;; Image -> Boolean

;;Purpose:
;; Produce true if image is tall

;; stub
;(define (image-tall? image) false)

;;Example:
(check-expect (image-tall? (rectangle 20 40 "solid" "red" )) true)
(check-expect (image-tall? (rectangle 80 40 "solid" "red" )) false)

;;Template:
;(define (image-tall? image)
  ;if(...image))

;;Function:
(define (image-tall? image)
  (> (image-height image) (image-width image)))

;_______________________________________________________

(define  I1 (rectangle 10 20 "solid" "red"))
(define  I2 (rectangle 20 20 "solid" "red"))
(define  I3 (rectangle 200 10 "solid" "red"))

;; Signature:
;; Image -> String

;; Purpose
;; Produce shape of image, one of "tall", "square", or "wide"

;;Examples:
(check-expect (aspect-ratio I1) "tall")
(check-expect (aspect-ratio I2) "square")
(check-expect (aspect-ratio I3) "wide")

;;Stub:
;(define (aspect-ratio img) "")

;;Template:
;(define (aspect-ratio img)
  ;(...img))

;;Function:
#;
(define (aspect-ratio img)
  (if(> (image-height img) (image-width img))
     "tall"
     (if (= (image-height img) (image-width img))
         "square"
         "wide")))

#;
(define (aspect-ratio img)
  (cond [Q A]
        [Q A]
        [else A]))

(define (aspect-ratio img)
  ;Question: Answer pair
  (cond [(> (image-height img) (image-width img)) "tall"]
        [(= (image-height img) (image-width img)) "square"]
        [else "wide"]))

;____________________________________________________

;; Data definitions:

;; TLColor is one of:
;;
;; - 0
;; - 1
;; - 2
;; interp. color of traffic light - 0 is red, - 1 is yellow, - 2 green

;; Signature:
;; TLColor -> TLColor
;; produce next color of traffic light

;_______________________________________________________

;; define-struct

(define-struct pos(x y))

(define P1 (make-pos 2 6))

(pos-x P1) ;selector
(pos? P1) ;predicate

;_______________________________________________________

;; Problem: create a hockey player, including both fist and last names

(define-struct player (first-name last-name))
;; Player is (make-paler String String)
;; interp (make-player first-name last-name)


(define P2 (make-player "Bobby" "Orr"))


(define (fn-for-player p)
  (... (player-first-name p)
       (player-last-name p)))

;_______________________________________________________________

;; define-struct practice

(define-struct WPI_student (first-name last-name gpa))
;; WPI_student is (make-WPI-student String String Number)
;; interp. (make-student first-name last-name gpa)

 (define me (make-WPI_student "Daniel" "Lang" 4.0))

 (WPI_student-first-name me)
 (WPI_student-last-name me)
 (WPI_student-gpa me)


 


            


