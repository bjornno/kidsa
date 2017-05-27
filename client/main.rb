require_relative '../lib/communication'


while true do
  puts "hvem vil du sende melding til?"
  print "> "
  mottaker = gets.chomp
  print "melding > "
  melding = gets.chomp
  send_melding(mottaker, krypter(1, melding))
end