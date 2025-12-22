require "net/ssh"


Net::SSH.start('bandit.labs.overthewire.org', 'bandit18', :password => 'x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO', :port => '2220') do |ssh|
  ssh.open_channel do |channel|
    channel.exec("cat readme") do |_, success|
      raise "Command failed" unless success

      channel.on_data do |_, data|
        puts data
      end
    end
  end

  ssh.loop
end
