;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |CS 1102 Reference Rule|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)


;; Tuition Graph V2

(define FONT-SIZE 24)
(define FONT-COLOR "black")


(define Y-SCALE 1/200)
(define BAR-WIDTH 30)
(define BAR-COLOR "lightblue")

;; Data definition
(define-struct school (name tuition))
;; School is (make-school String Natural)
;; interp. name is the school's name. tuition is internation studetnt's tuition in USD

(define S1 (make-school "school1" 28900))
(define S2 (make-school "school2" 31700))
(define S3 (make-school "school3" 40900))

(define (fn-for-school s)
  (... (school-name s)
       (school-tuition s)))

;; ListOfSchool is one of:
;; -empty
;; -(cons School ListOfSchool)
;; interp. a list of schools
(define LOS4 empty)
(define LOS5 (cons S1 (cons S2 (cons S3 empty))))

;; Functions:

#;
(define (fn-for-los los)
  (cond[(empty? los) (...)]
       [else
        (... (first los)
             (rest los))]))

;; ListOfSchool -> Image
;; produce bar chart showing names and tuitions of a given school



(check-expect (chart empty) (square 0 "solid" "white"))
(check-expect (chart (cons (make-school "S1" 8000) empty))
              (beside/align "bottom" (overlay/align "center" "bottom"
                                                    (rotate 90 (text "S1" FONT-SIZE FONT-COLOR))
                                                    (rectangle BAR-WIDTH (* 8000 Y-SCALE) "outline" "black")
                                                    (rectangle BAR-WIDTH (* 8000 Y-SCALE) "solid" BAR-COLOR ))
                            (square 0 "solid" "white")))

(check-expect (chart (cons (make-school "S2" 12000) (cons (make-school "S1" 8000) empty)))
              (beside/align "bottom" (overlay/align "center" "bottom"
                                                    (rotate 90 (text "S2" FONT-SIZE FONT-COLOR))
                                                    (rectangle BAR-WIDTH (* 12000 Y-SCALE) "outline" "black")
                                                    (rectangle BAR-WIDTH (* 12000 Y-SCALE) "solid" BAR-COLOR ))
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "S1" FONT-SIZE FONT-COLOR))
                                           (rectangle BAR-WIDTH (* 8000 Y-SCALE) "outline" "black")
                                           (rectangle BAR-WIDTH (* 8000 Y-SCALE) "solid" BAR-COLOR ))
                            (square 0 "solid" "white")))



;(define (chart los) (square 0 "solid" "white"))

(define (chart los)
  (cond[(empty? los) (square 0 "solid" "white")]
       [else
        (beside/align "bottom"
                      (make-bar (first los))
                      (chart (rest los)))]))

;;School -> Image
;;Produce the bar for a single school in the bar chart

;(define (make-bar school) (rectangle 10 10 "solid" "white"))
(define (make-bar school)
  (overlay/align "center" "bottom"
                 (rotate 90 (text (school-name school)FONT-SIZE FONT-COLOR))
                 (rectangle BAR-WIDTH (* (school-tuition school) Y-SCALE) "outline" "black")
                 (rectangle BAR-WIDTH (* (school-tuition school) Y-SCALE) "solid" BAR-COLOR)))

;______________________________________________________________________________________________________________




;; Helper Functions

(define BLANK (square 0 "solid" "white"))

;; ListOfImage is one of:
;; -empty
;; -(cons Image ListOfImage)
;; interp. An arbitrary number of images
(define LOI empty)
(define LOI2 (cons (rectangle 10 10 "solid" "white") (cons (rectangle 10 10 "solid" "white") empty)))

#;
(define (fn-for-loi loi)
  (cond[(empty? loi) (...)]
       [else
        (... (first loi)
             (fn-for-loi (rest loi)))]))


;; Functions:

;; ListOfImage -> Image
;; Take in an arbitrary list of images and lay out images left to right in increasing size

;(define (arrange-images loi) BLACK)

(check-expect (arrange-images empty) BLANK)
(check-expect (arrange-images (cons (rectangle 10 20 "solid" "blue")
                                    (cons (rectangle 20 30 "solid" "red")
                                          empty)))

              (beside
               (rectangle 10 20 "solid" "blue")
               (rectangle 20 30 "solid" "red")
               BLANK))
(check-expect (arrange-images (cons (rectangle 20 30 "solid" "blue")
                                    (cons (rectangle 10 20 "solid" "red")
                                          empty)))

              (beside
               (rectangle 10 20 "solid" "red")
               (rectangle 20 30 "solid" "blue")
               BLANK))

;; ListOfImage -> Image
;; sort list into ascending order and then lay out images from left to right in ascending order


#;
(define (arrange-images loi)
  (cond[(empty? loi) (...)]
       [else
        (... (first loi)
             (arrange-images (rest loi)))]))

(define (arrange-images loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; Place images besides each other in order of list
;; !!! (wish list)

(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons (rectangle 10 20 "solid" "blue")
                                   (cons (rectangle 20 30 "solid" "red")
                                         empty))) (beside
               (rectangle 10 20 "solid" "blue")
               (rectangle 20 30 "solid" "red")
               BLANK))




;(define (layout-images loi) BLANK)

(define (layout-images loi)
  (cond[(empty? loi) BLANK]
       [else
        (beside (first loi)
             (layout-images (rest loi)))]))

;; ListOfImage -> ListOfImage
;; sort images in increaseing order of size
;; !!! (wish list)
;(define (sort-images loi) loi)


(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons (rectangle 10 20 "solid" "blue")
                                   (cons (rectangle 20 30 "solid" "red")
                                         empty)))
              (cons (rectangle 10 20 "solid" "blue")
                                   (cons (rectangle 20 30 "solid" "red")
                                         empty)))


(check-expect (sort-images (cons (rectangle 20 30 "solid" "blue")
                                   (cons (rectangle 10 20 "solid" "red")
                                         empty)))
              (cons (rectangle 10 20 "solid" "red")
                                   (cons (rectangle 20 30 "solid" "blue")
                                         empty))) 






(define (sort-images loi)
  (cond[(empty? loi) empty]
       [else
        (insert (first loi)
             (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; insert an image into its proper place in list (increasing order of size)
;; ASSUME: lst is already sorted

;(define (insert image loi) loi)

(check-expect (insert (rectangle 10 20 "solid" "red") empty) (cons (rectangle 10 20 "solid" "red") empty))
(check-expect (insert (rectangle 10 20 "solid" "red") (cons (rectangle 20 30 "solid" "blue") empty)) (cons (rectangle 10 20 "solid" "red") (cons (rectangle 20 30 "solid" "blue") empty)))
(check-expect (insert (rectangle 20 30 "solid" "red") (cons (rectangle 10 20 "solid" "blue") empty)) (cons (rectangle 10 20 "solid" "blue") (cons (rectangle 20 30 "solid" "red") empty)))

(define (insert img loi)
  (cond[(empty? loi) (cons img empty)]
       [else
        (if (larger? img (first loi))
            (cons (first loi)  
             (insert img
                     (rest loi)))
            (cons img loi))]))

;; Image Image -> Boolean
;; Produce true if image 1 is larger than image 2 by area
;; !!!
;(define (larger? image1 image2) true)
(check-expect (larger? (rectangle 10 20 "solid" "red") (rectangle 20 30 "solid" "red")) false)
(check-expect (larger? (rectangle 20 30 "solid" "red") (rectangle 10 20 "solid" "red")) true)

(define (larger? image1 image2)
  (> (* (image-width image1) (image-height image1))
     (* (image-width image2) (image-height image2))))



