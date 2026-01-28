require 'http'
require 'json'
require 'dotenv'

Dotenv.load

# Fonction pour gérer l'appel API
def converse_with_ai(api_key, conversation_history)
  url = "https://api.openai.com/v1/completions"
  
  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }

  data = {
    "prompt" => conversation_history,
    "max_tokens" => 150,
    "temperature" => 0.5,
    "model" => "davinci-002",
    "stop" => ["Vous:", " Vous:", "\nVous:", "Vous :"] # Empêche l'IA de générer le texte à ta place
  }

  response = HTTP.post(url, headers: headers, body: data.to_json)
  response_body = JSON.parse(response.body.to_s)
  
  # Petit check pour éviter les crashs si l'API renvoie une erreur
  if response_body['error']
    puts "Erreur API : #{response_body['error']['message']}"
    return "..."
  end

  return response_body['choices'][0]['text'].strip
end

puts "Bienvenue sur le Chatbot. Tape 'stop' pour arrêter."

# On initialise le contexte
conversation_history = "Ceci est une conversation avec une IA intelligente.\n"

loop do
  print "Vous : "
  user_input = gets.chomp.strip

  break if user_input.downcase == "stop"

  # On ajoute ton message à l'histoire
  conversation_history += "Vous : #{user_input}\nIA :"

  # On envoie TOUTE l'histoire à l'IA
  ai_response = converse_with_ai(ENV['OPENAI_API_KEY'], conversation_history)

  puts "IA : #{ai_response}"

  # On ajoute la réponse de l'IA à l'histoire pour qu'elle s'en souvienne au prochain tour
  conversation_history += " #{ai_response}\n"
end