# Caesar Cipher

def caesar_cipher(input, shift = 0)
  ascii_values = if input.is_a? Numeric
                   input.to_s.bytes
                 else
                   input.bytes
                 end

  conversion = ascii_values.map { |value| (value + shift).chr }
  conversion.join('')
end
