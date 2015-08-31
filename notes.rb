# # Opening a new file:
# # This:
# fname = "sample.txt" #sets file name to a string that becomes file name
# somefile = File.open(fname, "w") #calls the File class "open" method, which requires 2 arguments. 1) file name as a string  2) the read/write/append mode (r = read, w = write, a = append)
# somefile.puts "Hello file!" #calls the File class "puts" method. This method prints to the file though, not to the screen.  Can also use "somefile.write" which doesn't include a new line at the end of the string.
# somefile.close #the File class "close" method finishes the writing process and prevents further data operations on the file (until you re-open it).

# # Can also be written like this:
# somefile = File.open("sample.txt", "w")
# somefile.puts "Hello file!"
# somefile.close 

# # Or like this:
# File.open("sample.txt", "w"){ |somefile| somefile.puts "Hello file!"}  #block convention automatically closes the file


require "rubygems"
require "rest-client"
wiki_url = "https://en.wikipedia.org/wiki/Main_Page"
wiki_local_filename = "wiki-page.html"
File.open(wiki_local_filename, w) { |file| file.write(RestClient.get(wiki_url)) }