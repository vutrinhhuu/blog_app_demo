source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"
gem "bcrypt", "3.1.12"
gem "bootstrap4-kaminari-views"
gem "carrierwave", "~> 1.2", ">= 1.2.3"
gem "faker", "1.9.1"
gem "figaro", "~> 1.1", ">= 1.1.1"
gem "kaminari"
gem "mini_magick", "~> 4.8"
gem "sidekiq", "~> 5.0", ">= 5.0.5"

gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "rubocop", "~> 0.54.0", require: false
gem "turbolinks", "~> 5"

gem "bootsnap", ">= 1.1.0", require: false

gem "bootstrap", "~> 4.1.1"
gem "config"
gem "jquery-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3"
end

group :production do
  gem "pg"
  gem "rails_12factor", "~> 0.0.3"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
