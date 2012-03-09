require 'java'

## Load our version of Smack, if the our user hasn't loaded one already
unless defined?(org.jivesoftware.smack)
  require File.dirname(__FILE__)+'/java/smack.jar'
end
