require 'net/ssh'


Net::SSH.start('bandit.labs.overthewire.org', 'bandit4', :password => '2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ', :port => '2220') do |ssh|
  files = ssh.exec!('ls -lah ./inhere/*').chomp
  files = files.split("\n")
  for file in files do
    file_splitted = file.split(' ')
    filename = file_splitted[-1]
    file_type = ssh.exec!("file #{filename}").chomp
    file_type = file_type.split(' ')
    file_type = file_type[1..-1]
    file_type = file_type.join(" ")
    if file_type == "ASCII text"
      password = ssh.exec!("cat #{filename}").chomp
      p password
    end
  end
end
