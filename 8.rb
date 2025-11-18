require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit8', :password => 'dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc', :port => '2220') do |ssh|
  passwords = ssh.exec!("cat data.txt").chomp
  passwords = passwords.split("\n")
  password_count = passwords.group_by(&:itself).transform_values(&:count)
  puts password_count.key(1)
end
