Vagrant.configure("2") do |config|
    config.vm.define 'collector' do |config|
        config.vm.box = 'ubuntu/bionic64'
        config.vm.hostname = 'collector'
        config.vm.network :forwarded_port, guest: 22, host: 2230, id: "ssh", auto_correct: false
        config.vm.network "private_network", ip: "192.168.50.50"
        config.vm.post_up_message = "Opullence collector is up"    
    end
    
    config.vm.provision "shell", inline: <<-SHELL
        groupadd -r wheel
        useradd -m -s /bin/bash -U collector -p vagrant -u 666 --groups wheel
        cp -pr /home/vagrant/.ssh /home/collector/
        chown -R collector:collector /home/collector
        echo "%collector ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/collector
        sed -i "s/vagrant/collector/g" /home/collector/.ssh/authorized_keys
    SHELL

    VAGRANT_COMMAND = ARGV[0]
    if VAGRANT_COMMAND == "ssh"
        config.ssh.username = 'collector'
    end

    config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "site.yml"
        ansible.limit = "collector"
        ansible.inventory_path = "inventory/local"
        ansible.extra_vars = {
            ssh_pub_key_dir: '.ssh-keys',
            ansible_user: 'collector'  
        }
    end
end