
require 'csv'
require 'date'
require 'google/apis/civicinfo_v2'
require 'erb'


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislator_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    "This person does not have a valid address."
  end
end

def save_letter(name = "thanks", id = "", form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')

  filename = "output/#{name}_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_number(number)
  number = remove_separators(number)

  length = number.digits.count
  case
  when length < 10
    "Invalid number"
  when 10 === length
    number
  when 11 === length
    number.trim[0] if number.digits.first == 1
  when length > 11
    "Invalid number"
  end
end

def remove_separators(number)
  number = number.tr('()-. ', '') # remove all separator variations
  number.to_i
end

def report_optimal_time(csv)
  # Store all values to compare here
  days = Hash.new(0)
  times = Hash.new(0)
  csv.each do |row|
    data = DateTime.strptime(row[:regdate], "%m/%d/%Y %H:%M")
    times[data.strftime("%H")]+=1 # hour
    days[data.strftime("%A")]+=1 # day
  end
  # Output to hash, each has a single value
  {
    day: days.key(days.values.max),
    time: times.key(times.values.max)
  }
end

puts "EventManager Initialized!"

attendees = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_letter = ERB.new template_letter

# puts attendees.each { |row| p row[:regdate]}
attendees.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_by_zipcode(zipcode)
  phone_number = clean_number(row[:homephone])

  personal_letter = erb_letter.result(binding)
  save_letter("thanks", id, personal_letter)
end

attendees = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

# Report
optimal_datetime = report_optimal_time(attendees)
day = optimal_datetime[:day].to_s
time = optimal_datetime[:time].to_s

report_template = File.read('report.erb')
erb_report = ERB.new report_template
personal_report = erb_report.result(binding)
save_letter("report", 1 , personal_report)
