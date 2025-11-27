require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit14', :keys => "sshkey.private", :port => '2220') do |ssh|
  command = ssh.exec!("cat /etc/bandit_pass/bandit14").chomp
  puts command
end
