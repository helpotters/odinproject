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

encrypted_text = caesar_cipher("Test, 123",100)

# Decrypted Text
caesar_cipher(encrypted_text,-100)

encrypted_numbers =  caesar_cipher(1234,23)

#Decrypted Numbers
caesar_cipher(encrypted_numbers,-23)
