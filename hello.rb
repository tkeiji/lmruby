#!/usr/bin/ruby
t = Time.now
puts(t.strftime("==%H:%M=="))
lines = fileds = 0
regbustime = Array.new();

file = open("regbus.txt")
while text = file.gets do
	textdata = text.chomp
	textarray = textdata.split(":")
	timedata = Time.local( t.strftime("%Y").to_i, t.strftime("%m").to_i, t.strftime("%d").to_i, textarray[0].to_i, textarray[1].to_i)
	regbustime << timedata
end
file.close

file = open("twinbus.txt")
while text = file.gets do
	textdata = text.chomp
	textarray = textdata.split(":")
	timedata = Time.local( t.strftime("%Y").to_i, t.strftime("%m").to_i, t.strftime("%d").to_i, textarray[0].to_i, textarray[1].to_i)
	regbustime << timedata
end
file.close

p regbustime

