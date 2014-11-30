#!/usr/bin/env python

import sys

if(len(sys.argv) < 2):
    print "please give me an iban"
    sys.exit()

### verifiy iban checksum ###

# full iban
iban = sys.argv[1] #"AT112032024401024138"

# stripped country code
countrycode = iban[:2]

# stripped checksum
checksum_orig = int(iban[2:4])

# bban + account nr.
bban = iban[4:9]
acc_nr = iban[9:]

# convert country code to number
letter1 = ord(countrycode[0]) - 55
letter2 = ord(countrycode[1]) - 55

# put string together
converted_str = bban + acc_nr  + str(letter1) + str(letter2) + '00'
converted = int(converted_str)

# calc checksum
checksum = 98 - converted % 97

print 'checksum:', checksum
if checksum == checksum_orig:
    print "checksum correct!"
else:
    print "checksum wrong!"
