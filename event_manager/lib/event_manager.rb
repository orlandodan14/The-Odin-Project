puts "EventManager Initialized!"

#Check if a file exists at the specified filepath:
#File.exist? "event_attendees.csv"

#Read the File Contents:
#contents = File.read "event_attendees.csv"
#puts contents

#Read the File Line By Line:
#lines = File.readlines "event_attendees.csv"
#lines.each do |line|
#  puts line
#end

#Display the First Name of All Attendees:
#lines = File.readlines('event_attendees.csv')
#lines.each_with-index do |line, index|
#  next if index == 0
#  columns = line.split(',')
#  name = columns[2]
#  puts name
#end

#Iteration 1: Parsing with CSV:
#require 'csv'
#contents = CSV.open('event_attendees.csv', headers: true)
#contents.each do |row|
#  name = row[:first_Name] #This is the same as: name = row[2]
#  name = row[2]
#  puts name
#end
#Accessing Columns by their Names
#contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
#contents.each do |row|
#  name = row[:first_name] #This is the same as: name = row[2]
#  zipcode = row[:zipcode] #Displaying the Zip Codes of All Attendees
#  puts "#{name} #{zipcode}"
#end

#Iteration 2: Cleaning up our Zip Codes:
#require 'csv'
#def clean_zipcode(zipcode)
#  zipcode.to_s.rjust(5, '0')[0..4] #It's the same as: nil.to_s - "123".rjust 5, "0" - "12345"[0..4]
#end
#contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
#contents.each do |row|
#  name = row[:first_name]
#  zipcode = clean_zipcode(row[:zipcode])
#  puts "#{name} #{zipcode}"
#end

#Iteration 3: Using Sunlight:
#require 'csv'
#require 'sunlight/congress'
#Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"
#def clean_zipcode(zipcode)
#  zipcode.to_s.rjust(5, '0')[0..4]
#end
#def legislators_by_zipcode(zipcode)
#  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
#  legislator_names = legislators.collect do |legislator|
#    "#{legislator.first_name} #{legislator.last_name}"
#  end
#  legislator_names.join(",")
#end
#contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
#contents.each do |row|
#  name = row[:first_name]
#  zipcode = clean_zipcode(row[:zipcode])
#  legislators = legislators_by_zipcode(zipcode)
#  puts "#{name} #{zipcode} #{legislators}"
#end

#Iteration 4: Form Letters:
require 'csv'
require 'sunlight/congress'
require 'erb'
Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end
def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end
contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
#contents.each do |row|
#  name = row[:first_name]
#  zipcode = clean_zipcode(row[:zipcode])
#  legislators = legislators_by_zipcode(zipcode)
#  form_letter = erb_template.result(binding)
#  puts form_letter
#end
#

#Outputting form letters to a file:
def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exist? "output"
  filename = "output/thanks_#{id}.html"
  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  save_thank_you_letters(id, form_letter)
end
