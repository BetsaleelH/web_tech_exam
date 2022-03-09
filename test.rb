require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/accueil', WEBrick::HTTPServlet::ERBHandler, 'accueil.html.erb')
server.mount('/goodgoya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goodgoya.rb')
server.mount('/badgoya.cgi', WEBrick::HTTPServlet::CGIHandler, 'badgoya.rb')
server.start