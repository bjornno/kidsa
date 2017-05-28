require 'rest-client'
require 'json'

$server_addr = "https://krypto-meldinger.herokuapp.com/"

def abonner(mottaker, display_func)
  Thread.new do
    puts "Starter å lytte etter meldinger til #{mottaker}"
    melding = {}
    while true do
      begin
        t = JSON.parse(RestClient.get("#{$server_addr}/#{mottaker}"), symbolize_names: true)
        if melding.melding != t.melding 
          melding = t
          display_func.call(melding)
        end
        sleep 2
      rescue
      end
    end
  end
end

def send_melding(mottaker, melding)
  begin
    puts "sender melding til #{mottaker}"
    5.times do 
      print "."
      sleep 0.2
    end
    puts ""
    print "> "
    RestClient.put("#{$server_addr}/#{mottaker}/", {
        avsender: $meg,
        mottaker: mottaker,
        melding: melding
      }.to_json)
  rescue
    puts "feilet å sende melding"
  end
end

$alfabet = ("a".."z").to_a
$alfabet << 'æ'
$alfabet << 'ø'
$alfabet << 'å'

def krypter(key, message)
  encrypted = ""
  message.split("").each do |c|
    if ($alfabet.include?(c))
      encrypted << $alfabet[($alfabet.index(c) + key) % $alfabet.size]
    else
      encrypted << c
    end
  end
  encrypted
end

def dekrypter(key, message)
  decrypted = ""
  message.split("").each do |c|
    if ($alfabet.include?(c))
      decrypted << $alfabet[($alfabet.index(c) - key) % $alfabet.size]
    else
      decrypted << c
    end
  end
  decrypted
end

puts "Hva heter du?"
print "> "
$meg = gets.chomp

def skriv_melding(melding)
  puts ""
  puts "Ny melding mottat"
  if (melding.kryptert)
    puts "dekrypter?"
    print "kode > "
    kode = gets.chomp.to_i
  else 
    kode = 0
  end
  puts "Melding: #{dekrypter(kode, melding.melding)}"
  puts ""
  print "> "
end

abonner($meg, method(:skriv_melding))
sleep 1