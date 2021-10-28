# Substrings
def substrings(string, dictionary)
  string_array = string.downcase!.split(' ')
  string_array.select!{ |word| dictionary.include?(word) }
  word_tally = string_array.reduce(Hash.new(0)) do |word_hash, word|
                    word_hash[word] += 1
                    word_hash
                end
  word_tally
end

dictionary = %w(a how do you do fellow kids total i will me try to hello and but or when why test like a george apples enjoy have just I magic toast harry potter said says wand hagrid nick he she his)

harry_potter_snippet = "As Harry squelched along the deserted corridor he came across somebody who looked just as preoccupied as he was. Nearly Headless Nick, the ghost of Gryffindor Tower, was staring morosely out of a window, muttering under his breath, \". . . don't fulfill their requirements . . . half an inch, if that . . .\"
\"Hello, Nick,\" said Harry.
\"Hello, hello,\" said Nearly Headless Nick, starting and looking round. He wore a dashing, plumed hat on his long curly hair, and a tunic with a ruff, which concealed the fact that his neck was almost completely severed. He was pale as smoke, and Harry could see right through him to the dark sky and torrential rain outside.
\"You look troubled, young Potter,\" said Nick, folding a transparent letter as he spoke and tucking it inside his doublet.
\"So do you,\" said Harry.
\"Ah,\" Nearly Headless Nick waved an elegant hand, \"a matter of no importance. . . . It's not as though I really wanted to join. . . . Thought I'd apply, but apparently I 'don't fulfill requirements' -\"
In spite of his airy tone, there was a look of great bitterness on his face.
\"But you would think, wouldn't you,\" he erupted suddenly, pulling the letter back out of his pocket, \"that getting hit forty-five times in the neck with a blunt axe would qualify you to join the Headless Hunt?\""

substrings(harry_potter_snippet, dictionary)
