require "rubygems"
require "rest-client"


wiki_url = "https://en.wikipedia.org/wiki/Main_Page"
wiki_local_filename = "wiki-page.html"
File.open(wiki_local_filename, "w") { |file| file.write(RestClient.get(wiki_url)) }