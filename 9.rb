require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit9', :password => '4CKMh1JI91bUIZZPXDqGanal4xvAg0JM', :port => '2220') do |ssh|
  password = ssh.exec!("strings data.txt | grep -oE '[A-Za-z0-9]{32}'").chomp
  puts password
end
