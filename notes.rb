# Creating a new file & writing to it:
# This:
fname = "sample.txt" #sets file name to a string that becomes file name
somefile = File.open(fname, "w") #calls the File class "open" method, which requires 2 arguments. 1) file name as a string  2) the read/write/append mode (r = read, w = write, a = append)
somefile.puts "Hello file!" #calls the File class "puts" method. This method prints to the file though, not to the screen.  Can also use "somefile.write" which doesn't include a new line at the end of the string.
somefile.close #the File class "close" method finishes the writing process and prevents further data operations on the file (until you re-open it).

# Can also be written like this:
somefile = File.open("sample.txt", "w")
somefile.puts "Hello file!"
somefile.close 

# Or like this:
File.open("sample.txt", "w"){ |somefile| somefile.puts "Hello file!"}  #block convention automatically closes the file


require "rubygems"
require "rest-client"
wiki_url = "https://en.wikipedia.org/wiki/Main_Page"
wiki_local_filename = "wiki-page.html"
File.open(wiki_local_filename, "w") { |file| file.write(RestClient.get(wiki_url)) }

-----------------------------------------------------------------

# Reading from a file
# This:
file = File.open("sample.txt", "r")
contents = file.read
puts contents  # => "Lorem ipsum blah blah blah"

contents = file.read
puts contents #=> ""  (calling a second time returns nothing, since the first "read call" above didn't specify line restrictions.)

#Can also be written in block format:
contents = File.open ("sample.txt", "r") { |file| file.read }
puts contents #=?> "Lorem ipsom blah blah blah"


#reading from a file using readlines:
File.open("sample.txt").readlines.each { |line| puts line } #draws in all content and parses as an array, splitting contents of file by line break

#reading from a file using readline:
File.open("sample.txt").readline.each { |line| puts line } #reads a singular line.  Call again for the next line, etc.
file=File.open("sample.txt", "r")
while !file.eof?  #eof meathod means "end of file" and returns boolean T/F.  This method call would output file contents line by line.
  line = file.readline
  puts line
end


require "open-uri"

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
local_fname = "hamlet.txt"
File.open(local_fname, "w") { |file| file.write(open(url).read) }

File.open(local_fname, "r") do |file|
  file.readlines.each_with_index do |line, idx|
    puts line if idx % 42 == 41 #remainder of 41 after modulo 42, because index starts at "0".
  end
end

--------------------------------------------------------------

# Closing a file
# Written like this:
datafile = File.open("sample.txt", "r")
lines = datafile.readlines
datafile.close

lines.each { |line| puts line }

# Or in a block, like this:(could be passed into other methods afterwards)
lines = File.open("sample.txt", "r") { |datafile| datafile.readlines }

lines.each { |line| puts line }

----------------------------------------------------------------

# File existence & properties
# Boolean check to see if a file w/ given name exists
if File.exists?(filename)
  puts "#{filename} exists"
end

# Create a new directory UNLESS it already exists.  Also add a new file to it.
dirname = "data-files"
Dir.mkdir(dirname) unless File.exists?dirname
File.open("#{dirname}/new-file.txt", "w") { |f| f.write("Hello World!") }

# search Directory name or pattern with wildcards and return an array of filenames
# count the files in my Downloads directory:
puts Dir.glob('Downloads/*').length   #=> 382

# count all files in my Downloads directory and in sub-directories
puts Dir.glob('Downloads/**/*').length   #=> 308858

# list just PDF files, either with .pdf or .PDF extensions:
puts Dir.glob('Downloads/*.{pdf,PDF}').join(",\n")