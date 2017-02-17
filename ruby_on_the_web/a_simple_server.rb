# Get sockets from stdlib and json
require 'socket'
require 'json'

# Socket to listen on port 2000
server = TCPServer.open(2000)

# Servers run forever
loop do
  client = server.accept                 # Wait for a client to connect
  request = client.read_nonblock(1024)   # Read the request the file
  
  # Split response at first blank line into headers and body:
  headers, body = request.split("\r\n\r\n", 2)
  header = headers.split
  
  req_type = header[0]           #Check if it is GET or POST
  path = header[1][1..-1]        #Check the file the client wants
  version = header[2]            #Check the version of the request
  
  
  if File.exist?(path)
    response = File.open(path)
    if req_type == 'GET'
      client.print "#{version} 200 OK\r\nDate: #{Time.now.ctime}\r\nContent-Length: #{response.size}\r\n\r\n#{response.read}"
    elsif req_type == 'POST'
      params = JSON.parse(body)   #Extract the date from a JSON string.
      client.print "#{version} 200 OK\r\nDate: #{Time.now.ctime}\r\n\r\n"
      client.print response.read.gsub("<%= yield %>", "<li>Name: #{params['viking']['name']}</li><li>E-mail: #{params['viking']['email']}</li>")
    end
  else      
    client.puts "#{version} 404 Not Found"
  end
  client.close
end