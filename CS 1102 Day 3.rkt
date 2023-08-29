;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |CS 1102 Day 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; ListOfNatural is either
;; -empty
;; -(cons Natural ListOfNatural)

(define (fn-for-lon lon)
  (cond[(empty? lon) ...]
       [else
        (...
         (first lon)
         (fn-for-lon(rest lon)))]))

;; ListOfNatural -> Natural
;; Sum all the even numbers in a list
;(define (sum-even lon) 0)





(define (sum-even lon)
  (cond[(empty? lon) 0]
       [(even? (first lon)) (+ (first lon) (sum-even (rest lon)))]
       [else
        (sum-even (rest lon))]))

(check-expect (sum-even empty) 0)
(check-expect (sum-even (list 1 3 5)) 0)
(check-expect (sum-even (list 2 3 5 7 8)) 10)
