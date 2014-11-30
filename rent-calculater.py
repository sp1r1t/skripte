#!/usr/bin/env python2.7

# persons
num_persons = 3

# hauptmietzins
total_rent_ex = 716.06
total_rent = total_rent_ex + (total_rent_ex * 0.1)

# betriebskosten
op_cost_ex = 183.64
op_cost = op_cost_ex + (op_cost_ex * 0.1)
op_cost_person = op_cost / num_persons

# area sizes
size_total = 135.15
size_room_big = 23.22
size_room_sm = 7.79
size_common = size_total - 2 * size_room_big - size_room_sm

size_common_person = size_common / num_persons

price_sqm = total_rent / size_total
price_room_big = size_room_big * price_sqm
price_room_sm = size_room_sm * price_sqm
price_common_person = size_common_person * price_sqm

jinn = price_room_sm + price_common_person + op_cost_person
jakob = price_room_big + price_common_person + op_cost_person
flo = price_room_big + price_common_person + op_cost_person
#luisa = price_room_big + price_common_person + op_cost_person
#birgit = price_room_big / 2 + price_common_person + op_cost_person
#daniel = price_room_big / 2 + price_common_person + op_cost_person

print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print "price square meter: " + repr(price_sqm)
print "jinn: " + repr(jinn)
print "jakob: " + repr(jakob)
print "flo: " + repr(flo)
print "total: " + repr(flo + jakob +  jinn)
print ""
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

interwebz = 26.15
montana = 105
verbund = 73.81
versicherung = 20.01
total = interwebz + montana + verbund + versicherung

print "Interwebz      : " + repr(interwebz)
print "Montana (Gas)  : " + repr(montana)
print "Verbund (Strom): " + repr(verbund)
print "Versicherung   : " + repr(versicherung)
print "---------------------------------------"
print "total          : " + repr(total)
print "per capita     : " + repr(total / num_persons)
print ""

print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print "jinn: " + repr(jinn + total / num_persons)
print "jakob: " + repr(jakob + total / num_persons)
print "flo: " + repr(flo + total / num_persons)
