Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.hostname = "taskserver"

  config.vm.define ENV["VAGRANT_SPAWN_ID"] do |machine|
    config.vm.provider "virtualbox" do |vb|
      vb.name = ENV["VAGRANT_SPAWN_ID"]
      vb.cpus = ENV["VAGRANT_CPU_LIMIT"]
      vb.memory = ENV["VAGRANT_MEMORY_LIMIT"]
    end
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  if ENV["VAGRANT_DEBUG"] == "yes"
    config.vm.synced_folder ENV["VAGRANT_HOST_BLACKBOX_PATH"], ENV["VAGRANT_SPAWN_BLACKBOX_PATH"], mount_options: ["uid=0", "gid=0", "ro"]
  end

  config.vm.synced_folder ENV["VAGRANT_HOST_QUESTION_PATH"], ENV["VAGRANT_SPAWN_QUESTION_PATH"], mount_options: ["uid=0", "gid=0", "ro"]
  config.vm.provision "shell", inline: <<-SHELL
    apt update && {
      DEBIAN_FRONTEND=noninteractive apt install -y unzip
    }
    {
      groupadd -g 1001 ubuntu
      useradd -u 1001 -g 1001 -s /bin/bash -m ubuntu
      cat >/etc/sudoers.d/ubuntu <<<"ubuntu ALL=(ALL) NOPASSWD:ALL"
      usermod -aG vagrant ubuntu
    }
  SHELL
end
