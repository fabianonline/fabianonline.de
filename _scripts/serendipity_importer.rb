# based on the import script by icebreaker, which is based on mojombo's
# https://github.com/mojombo/jekyll/blob/master/lib/jekyll/migrators/wordpress.rb
# https://gist.github.com/303570
# edited to rewrite image URLs to use my CloudFront URL

require 'rubygems'
require 'sequel'
require 'fileutils'
require 'yaml'
require 'activesupport'
require 'iconv'

# $ export DB=my_wpdb
# $ export USER=dbuser 
# $ export PASS=dbpass 
# $ ruby -r './lib/jekyll/migrators/serendipity' -e 'Jekyll::Serendipity.process( "#{ENV["DB"]}", "#{ENV["USER"]}", "#{ENV["PASS"]}")'

# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

module Jekyll
  module Serendipity

    # Reads a MySQL database via Sequel and creates a post file for each
    # post in wp_posts that has post_status = 'publish'.
    # This restriction is made because 'draft' posts are not guaranteed to
    # have valid dates.
    #QUERY = "select post_title, post_name, post_date, post_content, post_excerpt, ID, guid from wp_fol_posts where post_status = 'publish' and post_type = 'post'"
    QUERY = "SELECT id, title, body, extended, last_modified FROM blog_entries WHERE isdraft='false'"

    def self.process(dbname = '', user='', pass='', host = 'localhost', domain = '')
      rewriterules = []
      db = Sequel.mysql(dbname, :user => user, :password => pass, :host => host, :encoding=>"latin2")

      FileUtils.mkdir_p "_posts"

      db[QUERY].each do |post|
        # Get required fields and construct Jekyll compatible name
        #title = post[:post_title]
        #slug = post[:post_name]
        #date = post[:post_date]
        #content = post[:post_content]
	title = Iconv.iconv('utf-8', 'iso8859-15', post[:title])[0]
	slug = title.downcase
	slug = slug.gsub(/[^a-z 0-9äöüß]/, "")
	slug = slug.gsub("ä", "a").gsub("ö", "o").gsub("ü", "u").gsub("ß", "s").gsub(/ +/, "-")
	date = Time.at(post[:last_modified])
	date = date.to_date
	content = Iconv.iconv("utf-8", "iso8859-15", post[:body])[0] + "\n" + Iconv.iconv("utf-8", "iso8859-15", post[:extended])[0]

        name = "%02d-%02d-%02d-%s.html" % [date.year, date.month, date.day, slug]
        newname = "/%02d/%02d/%02d/%s" % [date.year, date.month, date.day, slug]

		# Process content to rewrite some URLs
		if domain
		        content = self.transformUrls(domain,content)
		end

        # Get the relevant fields as a hash, delete empty fields and convert
        # to YAML for the header
        data = {
           'layout' => 'post',
           'title' => title.to_s,
         }
	 
	 data['excerpt'] = Iconv.iconv("utf-8", "iso8859-15", post[:body])[0] if post[:extended].length>0
	 
	 data = data.delete_if { |k,v| v.nil? || v == ''}.to_yaml

        # Write out the data and content to file
        File.open("_posts/#{name}", "w") do |f|
          f.puts data
          f.puts "---"
          f.puts content
        end

	rewriterules << "RewriteRule   ^blog/archives/#{post[:id]}-.*        #{newname}        [R=permanent,L]"

	File.open("rewriterules.txt", "w") do |f|
	  f.puts(rewriterules.join("\n"))
	end
      end

    end

	# Process the content and replace URLs pointing to wp-content/uploads/
	# with CloudFront CNAME'd URL turbo.paulstamatiou.com/uploads/
	def self.transformUrls(domain,content)
		baseurl = "%s/wp-content/uploads/" % domain
		return content
		#return content.gsub(baseurl,"turbo.paulstamatiou.com/uploads/")
	end

  end
end
