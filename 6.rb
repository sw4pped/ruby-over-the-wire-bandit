require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit6', :password => 'HWasnPhtq9AVKe0dmk45nxy20cvUa6EG', :port => '2220') do |ssh|
  password_file = ssh.exec!("find / -user bandit7 -group bandit6 -size 33c 2>/dev/null").chomp
  password = ssh.exec!("cat #{password_file}").chomp
  puts password
end
