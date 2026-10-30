Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.hostname = "taskserver"
  config.ssh.insert_key = false

  config.vm.define ENV["VAGRANT_SPAWN_ID"] do |machine|
    machine.vm.provider "libvirt" do |lv|
      lv.default_prefix = ""
      lv.cpus = ENV["VAGRANT_CPU_LIMIT"].to_i
      lv.memory = ENV["VAGRANT_MEMORY_LIMIT"].to_i
      lv.machine_virtual_size = ENV["VAGRANT_DISK_LIMIT"].to_i
      lv.memorybacking :access, :mode => "shared"
    end

    machine.vm.synced_folder ".", "/vagrant", disabled: true

    virtiofs = {
      type: "virtiofs",
      readonly: true,
      mount_opts: "ro",
    }

    if ENV["VAGRANT_DEBUG"] == "yes"
      machine.vm.synced_folder ENV["VAGRANT_HOST_BLACKBOX_PATH"], ENV["VAGRANT_SPAWN_BLACKBOX_PATH"], virtiofs
    end

    machine.vm.synced_folder ENV["VAGRANT_HOST_QUESTION_PATH"], ENV["VAGRANT_SPAWN_QUESTION_PATH"], virtiofs
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt update && {
      DEBIAN_FRONTEND=noninteractive apt install -y unzip
    }

    groupadd -g 1001 ubuntu
    useradd -u 1001 -g 1001 -s /bin/bash -m ubuntu
    tee /etc/sudoers.d/ubuntu <<<"ubuntu ALL=(ALL) NOPASSWD:ALL"
    usermod -aG vagrant ubuntu
  SHELL
end
