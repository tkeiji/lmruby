#!/usr/bin/ruby
class Bustime
	def initialize(bust, twin)
		@bust = bust
		@twin = twin
  	end

	def getbust
		@bust
	end
	def gettwin
		@twin
	end
end

t = Time.now
puts(t.strftime("==%H:%M=="))
lines = fileds = 0
bustable = Array.new();

file = open("regbus.txt")
while text = file.gets do
	textdata = text.chomp
	textarray = textdata.split(":")
	timedata = Time.local( t.strftime("%Y").to_i, t.strftime("%m").to_i, t.strftime("%d").to_i, textarray[0].to_i, textarray[1].to_i)
	bustable << Bustime.new(timedata, false)
end
file.close

file = open("twinbus.txt")
while text = file.gets do
	textdata = text.chomp
	textarray = textdata.split(":")
	timedata = Time.local( t.strftime("%Y").to_i, t.strftime("%m").to_i, t.strftime("%d").to_i, textarray[0].to_i, textarray[1].to_i)
	bustable << Bustime.new(timedata, true)
end
file.close

bussort = bustable.sort{|aa, bb|
      aa.getbust <=> bb.getbust
    }

bussort.each{|aa|
	tdiff = t - aa.getbust

#	if(( tdiff < 600 ) && (tdiff > 1800) )
	if tdiff < 600 and tdiff > -1800
		print aa.getbust.strftime("%H:%M")
#		print "tdiff =", tdiff
		if (aa.gettwin == true)
			print " twinliner"
		end
		puts()
	end
}
