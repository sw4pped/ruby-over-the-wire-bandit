require 'net/ssh'
require 'base64'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit10', :password => 'FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey', :port => '2220') do |ssh|
  data_content = ssh.exec!("cat data.txt").chomp
  decoded_data_content = Base64.decode64(data_content)
  puts decoded_data_content.split(" ")[-1]
end
