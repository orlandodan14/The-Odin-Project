# Get sockets from stdlib and json
require 'socket'
require 'json'

host = 'localhost'                      # The web server
port = 2000                             # Default HTTP port

puts 'Send a (GET) or (POST) request?'  #Ask the user which type of request the user wants to send.
type = gets.chomp.upcase
if type == 'GET'
  path = '/index.html'                  # The file we want when uses GET
  # This is the HTTP request we send to fetch a file:
  request = "GET #{path} HTTP/1.0\r\n\r\n"
elsif type == 'POST'
  params = {:viking => {} }
  path = '/thanks.html'                 # The file we want when uses POST
  puts 'Enter name:'
  params[:viking][:name] = gets.chomp
  puts 'Enter e-mail:'
  params[:viking][:email] = gets.chomp
  # This is the HTTP request we send to fetch a file:
  request = "POST #{path} HTTP/1.0\r\nContent-Length: #{params.to_json.size}\r\n\r\n#{params.to_json}"
else
  puts 'Invalid request. Exiting...'
  exit
end


socket = TCPSocket.open(host, port)     # Connect to server
socket.print(request)                   # Send request
response = socket.read                  # Read complete response

# Split response at first blank line into headers and body:
headers, body = response.split("\r\n\r\n", 2)
message = headers.split(' ', 3)
code = message[1]
description_code = message[2]
case code
  when '200' then puts body
  when '404' then puts "Error #{code}: #{description_code}"
end