# Use the OAuth gem
require 'rubygems'
require 'oauth'
require 'pry'

# Your key/secrets for authentication
CONSUMER_KEY        = ENV["CONSUMER_KEY"]
CONSUMER_SECRET     = ENV["CONSUMER_SECRET"]
ACCESS_TOKEN        = ENV["ACCESS_TOKEN"]
ACCESS_TOKEN_SECRET = ENV["ACCESS_TOKEN_SECRET"]
binding.pry

# Set up an OAuth Consumer
@consumer = OAuth::Consumer.new CONSUMER_KEY, CONSUMER_SECRET, { :site => 'https://api.tradeking.com' }

# Manually update the access token/secret.  Typically this would be done through an OAuth callback when 
# authenticating other users.
@access_token = OAuth::AccessToken.new(@consumer, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

# Make a request to the API endpoint and display the response

puts @access_token.get('/v1/accounts.json', {'Accept' => 'application/json'}).body
puts @access_token.get('/v1/accounts/60573697/balances.json', {'Accept' => 'application/json'}).body
puts @access_token.get('/v1/accounts/60573697/balances.json', {'Accept' => 'application/json'}).body