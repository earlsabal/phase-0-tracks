def encrypt(thing)
	array = []
	i = 0
	while i < thing.length
		array << thing[i].next[0]
		i += 1
	end
	return array.join
end

def prev(letter)
  #(letter.chr.ord - 1).chr if (letter.chr.ord - 1). chr != "`"
  #"z" if (letter.chr.ord - 1).chr == "`"
  if letter == "a" 
  	return "z"
  else
  	(letter.chr.ord - 1).chr
  end

end

def decrypt(thing)
	array = []
	i = 0
	while i < thing.length
		array << prev(thing[i])
		i += 1
	end
	return array.join
end
=begin

puts encrypt("abc")
puts encrypt("zed")
puts decrypt("bcd")
puts decrypt("afe")
puts decrypt(encrypt("swordfish"))
This works because we encrypting then decrypting which undoes the encrypting
=end

def interface()
	puts "Do you want to encrypt or decrypt?"
	answer = gets
	puts "What is the password?"
	password = gets
	if answer == "encrypt"
		puts encrypt(password)
	else
		puts decrypt(password)
	end
	exit
end

interface()