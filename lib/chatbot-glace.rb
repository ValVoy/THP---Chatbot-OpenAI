require 'http'
require 'json'
require 'dotenv'

Dotenv.load

# Création de la clé d'api et indication de l'url utilisée.
api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/completions"

# Les headers pour l'authentification
headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

# Les données (le corps de la requête)
data = {
  "prompt" => "Liste moi 5 parfums de glace différents :",
  "max_tokens" => 50,
  "temperature" => 0.5,
  "model" => "babbage-002"
}

# Envoi de la requête POST
response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip

puts "Hello, voici 5 parfums de glace aléatoire :"
puts response_string