require 'rest-client'
require 'json'

$server_addr = "https://krypto-meldinger.herokuapp.com/"

$client = RestClient::Resource.new(
  $server_addr,
  headers: {
    'Content-Type' => 'application/json'
  }
)

def abonner(mottaker, display_func)
  puts "Starter å lytte etter meldinger til #{mottaker}"
  melding = {}
  Thread.new { 
    while true do
      begin
        t = JSON.parse($client[mottaker].get, symbolize_names: true)
        if melding.melding != t.melding 
          melding = t
          display_func.call(melding)
        end
      rescue
      end
      sleep 20
    end
  }
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
    $client[mottaker].put({
      avsender: $meg,
      mottaker: mottaker,
      melding: melding
    }.to_json)
  rescue Exception => e
    puts "Feilet å sende melding, exception: #{e.inspect}"
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