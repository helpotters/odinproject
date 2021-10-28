#!/usr/bin/env ruby

# 10 largest files
Dir.glob('Dropbox/*/**').sort_by { |fname| File.size(fname) }.reverse[0..9].each do |fname|
  puts "#{fname}\t#{File.size(fname)}"
end

# Determine file makeup of directories
file_types = {}
Dir.glob('Dropbox/*/**.***').each { |file| }
