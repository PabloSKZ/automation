#Script de création d'un dossier ruby complet pour un alias shell
​
#PRISE EN COMMANDE DU NOM DU DOSSIER DE PROJET
abort("mkruby : no space in the folder name, you silly punk !") if ARGV.count > 1
abort("mkruby : a name, god sake, GIVE ME A NAME !") if ARGV.empty?
​
input = ARGV.join
​
#CREATION DU DOSSIER
Dir.mkdir(input)
​
#CREATION DU DOSSIER LIB ET DU FICHIER APP
Dir.mkdir(input + "/lib")
File.open(input + "app.rb", "w")
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
#CREATION DU GEMFILE
Dir.chdir(input)
file_gemfile = File.open("Gemfile", "w")
system("echo \"source \'https://rubygems.org\'\" >> Gemfile")
system("echo \"ruby \'2.5.1\'\" >> Gemfile")
system("echo \"gem \'rspec\'\" >> Gemfile")
system("echo \"gem \'dotenv\'\" >> Gemfile")
system("echo \"gem \'rubocop\', \'\~\> 0.57.2\'\" >> Gemfile")
​
#INSTALLATION DES PROGRAMMES
system("bundle install")
system("git init")
system("rspec --init")
file_spec = File.open("spec/app_spec.rb", "w")
file_spec << "require_relative '../app.rb'"