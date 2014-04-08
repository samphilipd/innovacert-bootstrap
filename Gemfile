source 'https://rubygems.org'
ruby '2.1.1'
gem 'rails', '4.1.0.rc2'
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
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21, :rbx]
  gem 'html2haml'
#  gem 'quiet_assets' ## turn on if server log gets too verbose
  gem 'rails_layout'
  gem 'spring'
end
group :development, :test do
  gem 'thin'
end
group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end
group :doc do
  gem 'sdoc', '~> 0.4.0',          group: :doc
end
