require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit12', :password => '7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4', :port => '2220') do |ssh|
  temporal_directory = ssh.exec!("mktemp -d").chomp
  ssh.exec!("xxd -r ./data.txt > #{temporal_directory}/data.gz").chomp
  ssh.exec!("gzip -d #{temporal_directory}/data.gz").chomp
  ssh.exec!("mv #{temporal_directory}/data #{temporal_directory}/data.bz2").chomp
  ssh.exec!("bzip2 -d #{temporal_directory}/data.bz2").chomp
  ssh.exec!("mv #{temporal_directory}/data #{temporal_directory}/data.gz").chomp
  ssh.exec!("gzip -d #{temporal_directory}/data.gz").chomp
  ssh.exec!("mv #{temporal_directory}/data #{temporal_directory}/data.tar").chomp
  ssh.exec!("tar xvf #{temporal_directory}/data.tar -C #{temporal_directory}").chomp
  ssh.exec!("mv #{temporal_directory}/data5.bin #{temporal_directory}/data5.tar").chomp
  ssh.exec!("tar xvf #{temporal_directory}/data5.tar -C #{temporal_directory}").chomp
  ssh.exec!("mv #{temporal_directory}/data6.bin #{temporal_directory}/data6.bz2").chomp
  ssh.exec!("bzip2 -d #{temporal_directory}/data6.bz2").chomp
  ssh.exec!("mv #{temporal_directory}/data6 #{temporal_directory}/data6.tar").chomp
  ssh.exec!("tar xvf #{temporal_directory}/data6.tar -C #{temporal_directory}").chomp
  ssh.exec!("mv #{temporal_directory}/data8.bin #{temporal_directory}/data8.gz").chomp
  ssh.exec!("gzip -d < #{temporal_directory}/data8.gz > #{temporal_directory}/data8.out").chomp
  command = ssh.exec!("cat #{temporal_directory}/data8.out").chomp
  puts command.split(" ")[-1]
end
