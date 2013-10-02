# Use the OAuth gem
require 'rubygems'
require 'oauth'
require 'pry'
require 'JSON'
require 'active_support/all'

# Your key/secrets for authentication
CONSUMER_KEY='wxe7oBlTMLdkBEnW8R86ZaFonHORQ8GkHkNXf9dQ'
CONSUMER_SECRET='0GWWRp7WGV9iKZasGbwibpMHamMvGMxerDrMk237'
ACCESS_TOKEN='7Zo6O2CEis7PTaphPyAVllHTdft4O0gvYFHpszyY'
ACCESS_TOKEN_SECRET='jNQfRvVBhawaDGUcQBBU3W83ybgzmZoiuUzcIb5x'

# Set up an OAuth Consumer
@consumer = OAuth::Consumer.new CONSUMER_KEY, CONSUMER_SECRET, { :site => 'https://api.tradeking.com' }

# Manually update the access token/secret.  Typically this would be done through an OAuth callback when 
# authenticating other users.
@access_token = OAuth::AccessToken.new(@consumer, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

# Make a request to the API endpoint and display the response

# puts @access_token.get('/v1/accounts.json', {'Accept' => 'application/json'}).body

# gets my account info
# puts @access_token.get('/v1/accounts/60573697/balances.json', {'Accept' => 'application/json'}).body

# get stock info
stocks = 'aapl,ibm'
stock_info = @access_token.get("/v1/market/ext/quotes.xml?symbols=#{stocks}")

# parse stock info
hash = Hash.from_xml(stock_info.body)
aapl_adp_100 = hash['response']['quotes']['quote'][0]["adp_100"]