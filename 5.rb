require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit5', :password => '4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw', :port => '2220') do |ssh|
  file_with_passsword = ssh.exec!("find ./inhere -type f \! -executable -size 1033c").chomp
  password = ssh.exec!("cat #{file_with_passsword}").chomp
  puts password.strip
end
