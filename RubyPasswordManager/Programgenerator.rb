
# Define the character sets
uppercase_letters = ('A'..'Z').to_a
lowercase_letters = ('a'..'z').to_a
special_characters = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+']

# all_characters = uppercase_letters + lowercase_letters + numbers + special_characters

# Method to generate a random password
def generate_password(length)
# Define the characer sets
uppercase_letters = ('A'..'Z').to_a
lowercase_letters = ('a'..'z').to_a
numbers = ('0'..'9').to_a
special_characters = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+']

  # Combine all character sets into one array
all_characters = uppercase_letters + lowercase_letters + numbers + special_characters

# Shuffle the characters and select random characters based on the desired length
password = []
length.times do
  password << all_characters.sample
end

  # Join the array of characters into a single string and return the password
password.join
end

# Prompt the user to enter the desired password length
puts  "Enter the desired password length"
password_length = gets.chomp.to_i

# Generate the password
password = generate_password(password_length)

# Display the geerated password
puts "Generated password: #{password}"

if ARGV.length > 0
  password_length = ARGV[0].to_i
else
  # Prompt the user to enter the desired password
  puts "Enter the desired password length"
  password_length = gets.chomp.to_i
end

require 'securerandom'

def generate_password(length)
  # Define the character sets
  uppercase_letters = ('A'..'Z').to_a
  lowercase_letters = ('a'..'z').to_a
  numbers = ('0'..'9').to_a
  special_characters = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+']

  # Combine all character sets into one array
  all_characters = uppercase_letters + lowercase_letters + numbers + special_characters

  # Shuffle the characters and select random characters based on the desired length
  password = []
  length.times do
    password << all_characters[SecureRandom.random_number(all_characters.length)]
  end

  # Join the array of characters into a single string and return the password
  password.join
end

# Prompt the user to enter the desired password length
puts "Enter the desired password length"
password_length = gets.chomp.to_i

# Generate the password
password = generate_password(password_length)

# Display the generated password
puts "Generated password: #{password}"

def prompt_password_length
  loop do
    puts "Enter the desited password length (positive integer):"
    input = gets.champ
    if input.match?(/?\d+$/) && input.to_i > 0
      return input.to_i
    else
      puts "invalid input. Please enter a poditive integer"
    end
  end
end


# Generate the password
password_length = prompt_password_length
password = gernerate_password(password_length)
puts "Generated password: #{password}"
