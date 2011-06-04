#!/usr/bin/ruby

post_dir = File.join(File.dirname(__FILE__), "..", "_posts")

title = ARGV[0]
slug = title.downcase.
    gsub("ä", "ae").
    gsub("ö", "oe").
    gsub("ü", "ue").
    gsub("ß", "ss").
    gsub(/[^a-z0-9\- ]/, "").
    gsub(/ +/, "-").
    gsub(/-+/, "-")
filename = "#{ Time.now.strftime("%Y-%m-%d") }-#{slug}.markdown"

post_str = File.read(File.join(post_dir, "_vorlage"))
post_str.gsub!("TITLE", title)
File.open(File.join(post_dir, filename), "w") {|f|
    f.puts(post_str)
}

puts "Created => #{File.join(post_dir, filename)}"
