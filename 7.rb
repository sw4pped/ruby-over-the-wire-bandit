require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit7', :password => 'morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj', :port => '2220') do |ssh|
  password_line = ssh.exec!("grep millionth data.txt").chomp
  puts password_line.split(" ")[-1]
end
