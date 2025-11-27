require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit14', :password => 'MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS', :port => '2220') do |ssh|
  command = ssh.exec!("echo MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS | nc localhost 30000").chomp
  puts command.split("\n")[-1]
end