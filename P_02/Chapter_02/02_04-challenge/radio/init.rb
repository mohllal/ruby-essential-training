#!/usr/bin/env ruby

require_relative 'classes/radio'

puts "FM"

fm = Radio.fm
puts fm.status

# invalid volume
fm.volume = 12
puts fm.status

fm.crank_it_up
puts fm.status

# valid FM frequency
fm.frequency = 100.0
puts fm.status

# invalid FM frequency
fm.frequency = 30.0
puts fm.status

# invalid FM frequency
fm.frequency = 200.0
puts fm.status

puts "AM"

am = Radio.am
puts am.status

# invalid volume
am.volume = 12
puts am.status

am.crank_it_up
puts am.status

# valid AM frequency
am.frequency = 600.0
puts am.status

# invalid AM frequency
am.frequency = 400.0
puts am.status

# invalid AM frequency
am.frequency = 1800.0
puts am.status