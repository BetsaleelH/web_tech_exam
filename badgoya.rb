# Démarrez le programme CGI pour recevoir et renvoyer des données
require 'cgi'
cgi = CGI.new

# Après avoir reçu les données, renvoyez la réponse au format HTML
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # Sortez les données de "goya" utilisées comme marqueur d'information avec la description cgi ['goya'] et affectez-les à une variable locale.
  get = cgi['goya']

  #Return response in HTML
  "<html>
    <body>
      <p>Mauvaise qualité de goya</p>
      String：#{get}
    </body>
  </html>"
}