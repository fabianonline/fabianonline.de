#!/usr/bin/ruby

require 'rubygems'
require 'hpricot'
require 'open-uri'

doc = Hpricot(open('http://blog.fabianonline.de/sitemap.xml').read)

doc.search("//loc").each do |loc|
    loc = loc.innerHTML.gsub('http://blog.fabianonline.de', '/var/www/jekyll/_site')
    print loc
    print "--------------------------------------- fail ----------------------------------------" unless File.exists?(loc)
    puts
end

