require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit17', :keys => "sshkey-17.private", :port => '2220') do |ssh|
  command = ssh.exec!("diff passwords.new passwords.old | grep '^<'").chomp
  puts command.split(" ")[1]
end