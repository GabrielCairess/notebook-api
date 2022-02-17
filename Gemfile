source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"
gem "rails", "~> 7.0.2"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "rack-cors"
gem "active_model_serializers", "~> 0.10.0"
gem "foreman"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "faker"
  gem "pry-rails"
end

group :development do
end

