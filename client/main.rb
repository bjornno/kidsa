require_relative '../lib/communication'

meg = "mathias"

def skriv_melding(avsender, melding)
  puts ""
  puts "Ny melding fra #{avsender}: #{dekrypter(1, melding)}"
  puts ""
  print "> "
end

abonner(meg, method(:skriv_melding))

while true do
  melding = gets
  send_melding("haakon", krypter(1, melding))
end