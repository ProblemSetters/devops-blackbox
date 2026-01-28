Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.hostname = "taskserver"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  if ENV["BLACKBOX_FLAG__DEBUG_MODE"] == "yes"
    config.vm.synced_folder ENV["BLACKBOX_DIR"], "/blackbox", mount_options: ["uid=0", "gid=0", "ro"]
  end
  config.vm.synced_folder ENV["BLACKBOX_HOST_TEST_DIR"], "/test", mount_options: ["uid=0", "gid=0", "ro"]
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
