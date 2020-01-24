abort("mkruby : no space in the folder name, you silly punk !") if ARGV.count > 1
abort("mkruby : a name, god sake, GIVE ME A NAME !") if ARGV.empty?

input = ARGV.join

Dir.mkdir(input)

file = File.open(input + "/Gemfile", "w")

gem = ["source \"https://rubygems.org\"\n",
"ruby '2.5.1'\n",
"gem 'rspec'\n",
"gem 'pry'\n",
"gem 'rubocop', '~> 0.57.2'\n"]

gem.each {|i| file << i }

system("git init")

file = File.open(input + "/.env", "w")
file = File.open(input + "/.gitignore", "w")
file << ".env"

Dir.mkdir(input + "/lib")

system("rspec --init")

file = File.open(input + "/README.md", "w")






