require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit2', :password => '263JGJPfgU6LtdEvgfWU1XP5yac29mFx', :port => '2220') do |ssh|
  password_line = ssh.exec!("cat -- '--spaces in this filename--'").chomp
  puts password_line
end
