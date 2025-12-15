require 'net/ssh'

def integer_string?(str)
  Integer(str)
  true
rescue ArgumentError, TypeError
  false
end

Net::SSH.start('bandit.labs.overthewire.org', 'bandit16', :password => 'kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx', :port => '2220') do |ssh|
  tmp_dir = "/tmp/tmp.CzrWdH8l0D"
  ssh.exec!("nmap -vv -p31000-32000 localhost -oG #{tmp_dir}/openPorts").chomp
  ports = ssh.exec!("grep -oP '\\d+(?=/open)' #{tmp_dir}/openPorts").chomp
  ports = ports.split("\n")
  ports.each do |port|
    if integer_string?(port)
      port = port.to_i
      if port > 31000 and port < 32000
        command = ssh.exec!("echo kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx | ncat --ssl localhost #{port}").chomp
        puts "[+] Checking port: #{port}"
        if command.split(' ')[0] == "Correct!"
          ssh.exec!("echo '#{command}' > #{tmp_dir}/rsa_key")
          command = ssh.exec!("tail +2 #{tmp_dir}/rsa_key")
          File.open('sshkey-17.private', 'w') do |key|
            key.puts(command)
          end
          break
        end
      end
    end
  end
end
