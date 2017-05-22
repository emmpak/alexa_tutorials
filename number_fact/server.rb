require 'sinatra'
require 'json'
require 'net/http'

post '/' do
  number_facts_uri = URI("http://numbersapi.com/42")

  number_fact = Net::HTTP.get(number_facts_uri)
  {
    version: "1.0",
    response: {
      outputSpeech: {
        type: "PlainText",
        text: number_fact
      }
    }
  }.to_json
end
