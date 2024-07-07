require 'sinatra'
require 'securerandom'

# Method to generate a random password
def generate_password(length, options)
  uppercase_letters = options[:uppercase] ? ('A'..'Z').to_a : []
  lowercase_letters = options[:lowercase] ? ('a'..'z').to_a : []
  numbers = options[:numbers] ? ('0'..'9').to_a : []
  special_characters = options[:special] ? ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+'] : []

  all_characters = uppercase_letters + lowercase_letters + numbers + special_characters
  raise ArgumentError, "At least one character set must be selected" if all_characters.empty?

  password = []
  length.times { password << all_characters[SecureRandom.random_number(all_characters.length)] }
  password.join
end

get '/' do
  erb :index
end

post '/generate' do
  length = params[:length].to_i
  options = {
    uppercase: params[:uppercase] == 'on',
    lowercase: params[:lowercase] == 'on',
    numbers: params[:numbers] == 'on',
    special: params[:special] == 'on'
  }
  @password = generate_password(length, options)
  erb :result
end
