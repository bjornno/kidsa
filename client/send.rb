# encoding: UTF-8

require_relative '../lib/communication'

meg = "bjorn"
while true do
  puts "hvem vil du sende melding til?"
  print "> "
  mottaker = gets.chomp
  print "melding > "
  melding = gets.chomp
  print "kryptering > "
  kode = gets.chomp.to_i
  send_melding(mottaker, meg, krypter(kode, melding), kode != 0)
end