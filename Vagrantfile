Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "taskserver"
  config.vm.provider "virtualbox" do |vb|
    vb.name = ENV["BLACKBOX_HOST"]
    vb.cpus = 4
    vb.memory = "4096"
  end
  config.vm.synced_folder ENV["BLACKBOX_DIR"], "/blackbox", mount_options: ["uid=0", "gid=0", "ro"]
  config.vm.synced_folder ENV["BLACKBOX_HOST_USER_QUESTION_DIR"], ENV["BLACKBOX_USER_QUESTION_DIR"], mount_options: ["uid=1000", "gid=1000", "ro"]
  config.vm.provision "shell", inline: <<-SHELL
    apt update && {
      DEBIAN_FRONTEND=noninteractive apt install -y awscli unzip
    }
  SHELL
end
