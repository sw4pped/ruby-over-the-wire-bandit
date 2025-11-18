require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit1', :password => 'ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If', :port => '2220') do |ssh|
  password_line = ssh.exec!("cat ./-").chomp
  puts password_line
end
