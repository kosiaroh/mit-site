# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the exisying token
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file,token)
    token
  end
end
  
Ror::Application.config.secret_token = secure_token



#Ror::Application.config.secret_token = '771c7af1264905326cdd208ecb9a4d0e45d25ed6b9e21e98764175b042a7128fa6bcde811e14535c4962e7c32cf90adff1f7da166d0277c15dddc7b19160a01c'
