;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |CS 1102 Day1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; Natural String String -> Image
;; drawing four square checkered pattern
;(define (four-square width color1 color2)
;  (square 50 "solid" "red"))

(define(four-square width color1 color2)
  (above
   (beside(square width "solid" color1)
          (square width "solid" color2))
   (beside(square width "solid" color2)
          (square width "solid" color1))))

;(check-expect (four-square 50 "purple" "yellow") (four-square 50 "purple" "yellow"))

(four-square 50 "purple" "yellow")