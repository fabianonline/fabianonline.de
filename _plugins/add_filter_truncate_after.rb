module Jekyll
    module Filters
        def truncate_after(text, splitter="some string that will never be used in a normal post. foobarbaz")
            text.split(splitter)[0]
        end
    end
end
