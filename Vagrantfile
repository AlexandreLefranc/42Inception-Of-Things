Vagrant.configure("2") do |config|
    config.vm.box = "debian/bookworm64"
    config.vm.box_version = "12.20250126.1"
    config.vm.hostname = "VM-IoT"
    
    config.vm.provision "shell", name: "install-required-packages", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y gnupg2 vim
    SHELL

    config.vm.provision "shell", name: "install-vagrant", inline: <<-SHELL
      wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
      echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
      sudo apt-get update && sudo apt-get install -y vagrant
    SHELL
    
    config.vm.provision "shell", name: "install-virtualbox", inline: <<-SHELL
      wget -O- -q https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmour -o /usr/share/keyrings/oracle_vbox_2016.gpg
      echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle_vbox_2016.gpg] http://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
      sudo apt-get update && sudo apt-get install -y virtualbox-7.1
    SHELL

    config.vm.provision "shell", name: "reboot", inline: "", reboot: true

    config.vm.provider "virtualbox" do |v|
      v.name = "InceptionOfThings"
      v.cpus = 3
      v.memory = 1024 * 8
      v.check_guest_additions = false
      v.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
    end
end