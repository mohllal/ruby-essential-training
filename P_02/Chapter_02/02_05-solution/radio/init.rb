#!/usr/bin/env ruby

require_relative 'classes/radio'

fm = Radio.fm
puts fm.status

fm.crank_it_up
puts fm.status
