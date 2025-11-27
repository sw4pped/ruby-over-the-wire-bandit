require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit15', :password => '8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo', :port => '2220') do |ssh|
  command = ssh.exec!("echo 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo | ncat --ssl localhost 30001").chomp
  puts command.split("\n")[-1]
end