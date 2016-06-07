#!/usr/bin/ruby
require "optparse"

#
# This checker script reads first line of file and get numeral value. And then it compare numbers.
#
# cat /tmp/application.txt
# => 350
#
# ruby check_numeral_value_in_file.rb -f /tmp/application.txt -w 100 -c 200 --bigger
# => CRITICAL - 350 is bigger than threshold vale of 200.|num=350
#
# ruby check_numeral_value_in_file.rb -f /tmp/application.txt -w 400 -c 300 --smaller
# => WARNING - 350 is smaller than threshold vale of 400.|num=350
#

params = ARGV.getopts('f:', 'w:', 'c:', 'bigger', 'smaller')

# Get num from file
num = 0
open(params["f"]) {|file|
  while l = file.gets
    num = l.chomp
    break
  end
}

# Check
message = ''
if params["bigger"] == true
  if num >= params["w"]
    message = "WARNING - #{num} is bigger than threshold vale of #{params["w"]}.|num=#{num}"
  end
  if num >= params["c"]
    message = "CRITICAL - #{num} is bigger than threshold vale of #{params["c"]}.|num=#{num}"
  end
end

if params["smaller"] == true
  if num <= params["w"]
    message = "WARNING - #{num} is smaller than threshold vale of #{params["w"]}.|num=#{num}"
  end
  if num <= params["c"]
    message = "CRITICAL - #{num} is smaller than threshold vale of #{params["c"]}.|num=#{num}"
  end
end

# Output
if message =~ /WARNING/
  puts message
  exit 1
elsif message =~ /CRITICAL/
  puts message
  exit 2
else
  puts "OK - num is #{num}.|num=#{num}"
  exit 0
end
