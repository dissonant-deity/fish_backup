require 'byebug'
require 'colored'


def fish_function_names_and_definitions
  fish_dir = "~/.config/fish/functions"
  func_files = `ls #{fish_dir}`.split("\n")
  func_calling_names = func_files.map { |f| f[0..-6] }
    # easier than regex, strips the .fish extension
  
  core_function_definitions = func_files.map do |f|
   `cat #{fish_dir}/#{f}`.split("\n")
  end.map { |d| d[1..-2][0] }

  [func_calling_names, core_function_definitions].transpose
    # transpose combines [1,2] and [3,4] into [[1,3], [2,4]] 
end

puts "this program will look in ~/.config/fish/functions " +
"for function definitions and write them to a file in " + 
"markdown format. If there is a file named output.md in " + 
"this directory it will be permanently destroyed. " + 
"do you want to continue? (press enter)"

confirm = gets

exit unless confirm == "\n"

puts "writing to file" + "\n\n"

puts ("+" * 10) + "\n\n"

names_definitions = fish_function_names_and_definitions

intro = <<-MD
  ## Fish functions (aliases)
 
 These are the fish functions stored at `~/.config/fish/functions`.

  ====================

MD

body = names_definitions.map do |name_definition|
  name, definition = [0,1].map { |i| name_definition[i] }
  str = <<-MD
    ##### !!name
    
    !!definition  

    --------------      

  MD
  str.gsub(/\!\!name/, name).gsub(/\!\!definition/, definition)
end

begin
  `rm output.md`
rescue StandardError
   puts "\n" + "this error can be safely ignored".green + "\n"
end

`touch output.md`

f = File.open('output.md', 'w')
f.write(
  [
    intro,
    body
  ].join("")
)
f.close

puts `cat output.md` + "\n\n"

puts ("+" * 10) + "\n\n"
puts "file was written (with the contents printed above this line)"

puts "\n\n"

loop do
  puts "do you want to save your fish functions into a tar gz archive? fish_functions.tar.gz will be overwritten (y/n)"
  case gets.chomp.downcase
  when "y"
    break
  when "n"
   puts "exiting"
   exit
  else
   next
  end
end

begin
  `rm output.tar.gz`
rescue StandardError
  puts "this error is safe to ignore"
  true
end

`tar -czvf fish_functions.tar.gz ~/.config/fish/functions`

puts "\n"
puts "done"
