#!/usr/bin/env ruby

require_relative 'classes/radio'
require_relative 'classes/secure_radio'

# Radio
radio = Radio.new
puts radio.status
radio.play
radio.play
radio.play

puts

# Secure Radio
secure_radio = SecureRadio.new
puts secure_radio.status
secure_radio.play
secure_radio.play
secure_radio.play
