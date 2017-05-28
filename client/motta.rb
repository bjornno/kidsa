# encoding: UTF-8

require_relative '../lib/communication'


puts "Hva heter du?"
print "> "
$meg = gets.chomp

abonner($meg, method(:skriv_melding))
