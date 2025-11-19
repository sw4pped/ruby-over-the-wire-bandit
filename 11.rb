require 'net/ssh'
require 'base64'

$uppercase_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
$lowercase_alphabet = "abcdefghijklmnopqrstuvwxyz"
$alphabet_length = 26
$lower_limit_uppercase = 65
$lower_limit_lowercase = 97

def rot_13(phrase)
  phrase_with_rotations = ""
  for letter in phrase.chars
    if !letter.match(/^[[:alpha:]]$/)
      phrase_with_rotations += letter
      next
    end

    alphabet = $uppercase_alphabet
    limit = $lower_limit_uppercase

    if letter == letter.downcase
      alphabet = $lowercase_alphabet
      limit = $lower_limit_lowercase
    end

    ascii_value = letter.ord

    new_position = (ascii_value - limit + 13) % $alphabet_length

    phrase_with_rotations += alphabet[new_position]
  end

  phrase_with_rotations
end


Net::SSH.start('bandit.labs.overthewire.org', 'bandit11', :password => 'dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr', :port => '2220') do |ssh|
  data_content = ssh.exec!("cat data.txt").chomp
  decoded_data = rot_13(data_content)
  puts decoded_data.split(" ")[-1]
end