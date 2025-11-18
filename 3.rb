require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit3', :password => 'MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx', :port => '2220') do |ssh|
  password_line = ssh.exec!('cat ./inhere/...Hiding-From-You').chomp
  puts password_line
end
