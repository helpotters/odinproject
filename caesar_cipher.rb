# Caesar Cipher

def caesar_cipher(input, shift = 0)
  if input.is_a? Numeric
    ascii_values = input.to_s.bytes
  else
    ascii_values = input.bytes
  end

  conversion = ascii_values.map { |value| (value + shift).chr }
  output = conversion.join('')
  p output
end

encrypted_text = caesar_cipher("Test, 123",10) # "^o}~6*;<="

# Decrypted Text
caesar_cipher(encrypted_text,-10)

encrypted_numbers =  caesar_cipher(1234,23) # "HIJK"

#Decrypted Numbers
caesar_cipher(encrypted_numbers,-23)
