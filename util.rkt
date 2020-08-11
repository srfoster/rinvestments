#lang racket

(provide 
  summarize
  (struct-out holding))

(require 
  syntax/parse/define
  (for-syntax racket/syntax
	      racket/format))

(struct holding (account name symbol shares price total))

(define-for-syntax (slugify s)
  (string-downcase
    (regexp-replaces
      (~a s)
      '([#rx"[^A-Za-z0-9 ]" ""]
	[#rx"[ ]+" "-"]))))

(define-syntax (define-holding-type stx)
  (syntax-parse stx
		[(_ full-name symbol ...)
		 #:with name (format-id stx
					"is-~a-holding?"
					(slugify 
					  (syntax-e #'full-name)))
		 #`(begin
		     (provide name)
		     (set! all-holding-types (cons full-name all-holding-types))
		     (define (name h)
		       (or
			 (string=? (holding-symbol h) symbol)
			 ...)))]))

(define all-holding-types '())

(define-holding-type "Real Estate" "VNQ" "VGSLX")
(define-holding-type "Domestic Equity" "VTI"  "VTSAX") 
(define-holding-type "US Treasury Bonds (Long Term)" "VGLT")
(define-holding-type "Foreign Developed Equity" "VEA")
(define-holding-type "Money Market" "VMFXX")
(define-holding-type "Emerging Market Equity" "VWO")
(define-holding-type "US Treasury Inflation-Protected Securities" "VTIP")
(define-holding-type "Commodities" "VAW")

(define (summarize holdings)
  all-holding-types  
  )









