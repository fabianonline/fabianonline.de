#!/bin/sh

#ruby -pi.bak1 -e "gsub(/http:\/\/blog.fabianonline.de\/wp-content\/main\//, '/uploads/images/')" ../_posts/*.markdown
#ruby -pi.bak2 -e "gsub(/http:\/\/blog.fabianonline.de\/wp-content\/uploads\//, '/uploads/images/')" ../_posts/*.markdown

#ruby -pi.bak3 -e "gsub(/\"\/blog\/uploads\//, '\"/uploads/images/serendipity/')" ../_posts/*.html
ruby -pi.bak4 -e "gsub(/'\/blog\/uploads\//, '\'/uploads/images/serendipity/')" ../_posts/*.html


