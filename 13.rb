require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit13', :password => 'FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn', :port => '2220') do |ssh|
  command = ssh.exec!("cat sshkey.private").chomp
  puts '[+] Saving private key'
  File.open('sshkey.private', 'w') do |key|
    key.puts(command)
  end
  puts '[+] Private key successful'
end
