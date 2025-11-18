require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit0', :password => 'bandit0', :port => '2220') do |ssh|
  password_line = ssh.exec!('grep "The password you are looking for is:" readme').chomp
  password_line_splitted = password_line.split(" ")

  puts password_line_splitted[-1]
end
