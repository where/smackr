require 'java'

## Load our version of Smack (with smackx), if the our user hasn't loaded
## one already
smack_is_already_loaded = org.jivesoftware.smack.Connection rescue nil
unless smack_is_already_loaded
  require File.dirname(__FILE__)+'/java/smack.jar'
  require File.dirname(__FILE__)+'/java/smackx.jar'
  org.jivesoftware.smack.Connection # this does stuff, oddly enough
end

## Load Smackr
%w(main version chat room).each do |file|
  require File.dirname(__FILE__)+"/smackr/#{file}"
end

