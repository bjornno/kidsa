require_relative '../lib/communication'


while true do
  puts "hvem vil du sende melding til?"
  print "> "
  mottaker = gets.chomp
  print "melding > "
  melding = gets.chomp
  print "kryptering > "
  kode = gets.chomp.to_i
  send_melding(mottaker, krypter(kode, melding))
end