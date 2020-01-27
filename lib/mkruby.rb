def system_call
    system("git init")
    system("rspec --init")    
end

file = File.open("app.rb", "w")

file = File.open("Gemfile", "w")

gem = ["source \"https://rubygems.org\"\n",
"ruby '2.5.1'\n",
"gem 'rspec'\n",
"gem 'pry'\n",
"gem 'dotenv'\n",
"gem 'rubocop', '~> 0.57.2'\n"]

gem.each {|i| file << i }

file = File.open(".env", "w")
file = File.open(".gitignore", "w")
file << ".env"

Dir.mkdir("lib")

file = File.open("Readme.md", "w")

system_call

file = File.open("spec/app_spec.rb", "w")
file << "require_relative '../app.rb'"
