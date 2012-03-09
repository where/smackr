source "http://rubygems.org"

group :development do
  gem "shoulda", ">= 0"
  gem "rdoc", "~> 3.12"
  gem "bundler", "~> 1.0.0"
  gem "jeweler", "~> 1.8.3"
  gem "simplecov"
end

## Prevent this gem from being installed outside of JRuby.
## This approach is hackish, but the deficiencies of gemspec's
## 'platform' directive leave no choice.  --gamache
gem "smackr is for JRuby only!", '~> 999.999',
    :platforms => [:ruby, :mswin, :mingw]
