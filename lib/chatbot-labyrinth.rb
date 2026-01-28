require 'http'
require 'json'
require 'dotenv'

Dotenv.load

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/completions"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

puts "Colle le code Ruby bugué ici (termine par une ligne vide et CTRL+D ou tape END):"
code_input = $stdin.read # Lit tout le bloc de texte collé

data = {
  "prompt" => "Corrige le code Ruby suivant qui contient des fautes de syntaxe et explique les erreurs :\n\n#{code_input}",
  "max_tokens" => 500,
  "temperature" => 0,
  "model" => "gpt-3.5-turbo-instruct"
}

response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
correction = response_body['choices'][0]['text'].strip

puts "--- Correction proposée ---"
puts correction