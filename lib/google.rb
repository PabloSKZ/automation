require 'launchy'
require 'pry'

abort("goo : missing input") if ARGV.empty?

input = ARGV.join(' ')

url = "https://www.google.com/search?q=" + input

Launchy.open(url)