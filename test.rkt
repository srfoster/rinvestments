#lang racket

(require "util.rkt")

(require rackunit)
(define vanguard-data
  (list
    (holding 1 "VANGUARD SHORT TERM INFLATION PROTECTED SECURITIES ETF" "VTIP" 45.02 50.755 2284.99)
    (holding 1 "VANGUARD MATERIALS ETF"                                 "VAW" 28.658 133.1544 3815.94)
    (holding 1 "VANGUARD FTSE EMERGING MARKETS ETF"                     "VWO" 77.45 44.2701 3428.72)
    (holding 1 "VANGUARD LONG TERM TREASURY ETF"                        "VGLT" 40.728 103.81 4227.97)
    (holding 1 "VANGUARD FTSE DEVELOPED MKTS ETF"                       "VEA" 234.096 41.11 9623.69)
    (holding 1 "Vanguard Total Stock Market Index Fund Admiral Shares"  "VTSAX" 214.746 81.57 17516.83)
    (holding 1 "VANGUARD TOTAL STOCK MARKET ETF"                        "VTI" 23.991 168.619 4045.34)
    (holding 1 "VANGUARD REAL ESTATE INDEX ETF"                         "VNQ" 130.619 80.975 10576.87)
    (holding 1 "Vanguard Federal Money Market Fund"                     "VMFXX" 215 1 215)
    (holding 2 "VANGUARD SHORT TERM INFLATION PROTECTED SECURITIES ETF" "VTIP" 14.632 50.755 742.65)
    (holding 2 "Vanguard Real Estate Index Fund Admiral Shares"         "VGSLX" 50.841 115.47 5870.61)
    (holding 2 "VANGUARD FTSE EMERGING MARKETS ETF"                     "VWO" 4.268 44.2701 188.94)
    (holding 2 "VANGUARD LONG TERM TREASURY ETF"                        "VGLT" 23.779 103.81 2468.5)
    (holding 2 "VANGUARD FTSE DEVELOPED MKTS ETF"                       "VEA" 20.155 41.11 828.57)
    (holding 2 "VANGUARD TOTAL STOCK MARKET ETF"                        "VTI" 4.094 168.619 690.33)
    (holding 2 "VANGUARD REAL ESTATE INDEX ETF"                         "VNQ" 49.485 80.975 4007.05)
    (holding 2 "Vanguard Federal Money Market Fund"                     "VMFXX" 0.02 1 0.02)))

(check-equal?
  (length (filter is-real-estate-holding? vanguard-data)) 
  3
  "There should be three real estate holdings in this data")

(check-equal?
  (length (filter is-domestic-equity-holding? vanguard-data)) 
  3
  "There should be three domestic stock holdings in this data")


;TODO: Fix this test
(check-equal?
  (summarize vanguard-data) 
  (list
    (list "Real Estate" 10000 30.0)  )
  "")





