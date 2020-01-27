#PRISE EN COMMANDE DU NOM DU DOSSIER DE PROJET
abort("mkruby : no space in the folder name, you silly punk !") if ARGV.count > 1
abort("mkruby : a name, god sake, GIVE ME A NAME !") if ARGV.empty?
​
input = ARGV.join
​
#CREATION DU DOSSIER
Dir.mkdir(input)
​
#CREATION DU DOSSIER LIB
Dir.mkdir(input + "/lib")
​
#CREATION DU GEMFILE
file_gemfile = File.open(input + "/Gemfile", "w")
​
gem = ["source \"https://rubygems.org\"\n",
"ruby '2.5.1'\n",
"gem 'rspec'\n",
"gem 'pry'\n",
"gem 'dotenv'\n",
"gem 'rubocop', '~> 0.57.2'\n"]
​
gem.each {|i| file_gemfile << i }
​
#CREATION DES FICHIERS CACHES
File.open(input + "/.env", "w")
​
file_gitignore = File.open(input + "/.gitignore", "w")
file_gitignore << ".env"
​
#CREATION DU README
file_readme = File.open(input + "/README.md", "w")
file_readme << "# " + input.upcase
​
#INSTALLATION DES PROGRAMMES
Dir.chdir(input)
system("bundle install")
system("git init")
system("rspec --init")





