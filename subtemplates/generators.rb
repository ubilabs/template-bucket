@generate.each{|k,v| say("Apply generator for '#{k}'",:cyan); v.call} if @generate