require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit13', :password => 'FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn', :port => '2220') do |ssh|
  command = ssh.exec!("cat sshkey.private").chomp
  puts '[+] Saving private key...'
  File.open('sshkey.private', 'w') do |key|
    key.puts(command)
  end
  puts '[+] Private key saved successfully'
end

Net::SSH.start('bandit.labs.overthewire.org', 'bandit14', :keys => "sshkey.private", :port => '2220') do |ssh|
  command = ssh.exec!("cat /etc/bandit_pass/bandit14").chomp
  puts command
end