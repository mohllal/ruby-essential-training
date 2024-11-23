#!/usr/bin/env ruby

require 'erb'
require 'csv'

#### Mail Merge ####
#
# Launch this Ruby file from the command line
# to get started
# 

APP_ROOT = File.expand_path(File.dirname(__FILE__))

TEMPLATE_PATH = File.join(APP_ROOT, 'letter_template.txt')
template = File.read(TEMPLATE_PATH)

CSV_PATH = File.join(APP_ROOT, 'us_presidents.csv')
csv = CSV.read(CSV_PATH, headers: true)

i = 0
csv.each do |row|
  @last_name = row['Last Name']
  @first_name = row['First Name']
  @start = row['Start']
  @end = row['End']
  @party = row['Party']
  @state = row['State']
  @wikipedia = row['Wikipedia']

  @title = "The History of #{@state}"
  @due_date = @end
  years = Time.now.year - @due_date.to_i
  @fee = "$#{years * 365}.00"

  letter = ERB.new(template).result(binding)

  num = i < 10 ? "0#{i}" : i
  filename = "letter_#{num}.txt"
  filepath = File.join(APP_ROOT, 'letters', filename)

  puts "-------"
  puts filepath
  puts letter

  i += 1
  File.write(filepath, letter)
end