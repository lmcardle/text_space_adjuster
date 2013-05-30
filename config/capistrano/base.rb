def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    # run "#{sudo} chmod 600 /home/#{user}/.ssh/authorized_keys"
    run "#{sudo} sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config"
    run "#{sudo} sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install build-essential curl git-core python-software-properties openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev"
  end
end

namespace :base do
  desc "Make sure manifest.yml file is present"
  task :setup do
    run "mkdir -p #{shared_path}/assets"
  end
  after "deploy:setup", "base:setup"
end