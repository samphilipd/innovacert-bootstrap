source 'https://rubygems.org'
ruby '2.1.1'
gem 'rails', '~> 4.1.0'
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass'
gem 'haml-rails'
gem 'high_voltage'
gem 'pg'
gem 'figaro', github: 'laserlemon/figaro', ref: "9bbc7343f3916e73c185d071608e5ef24e9638d0" # specific version needed for compatibility with rails 4.10.rc2
# nested JS forms with bootstrap integration
gem 'bootstrap_form', github: 'bootstrap-ruby/rails-bootstrap-forms' # latest version needed for nesting support
gem 'nested_form'
# I18n support
gem 'i18n'

group :development do
  gem 'pry'
  gem 'rspec'
  gem 'factory_girl'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21, :rbx]
  gem 'html2haml'
#  gem 'quiet_assets' ## turn on if server log gets too verbose
  gem 'rails_layout'
  gem 'spring'
  gem 'thin'
end
group :production do
  gem 'thin'
  gem 'rails_12factor'
end
group :doc do
  gem 'sdoc', '~> 0.4.0'
end
