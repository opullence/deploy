Vagrant.configure("2") do |config|
    config.vm.define 'collector' do |config|
        config.vm.box = 'ubuntu/bionic64'
        config.vm.hostname = 'collector'
        config.vm.network :forwarded_port, guest: 22, host: 2230, id: "ssh", auto_correct: false
        config.vm.network "private_network", ip: "192.168.50.50"
        config.vm.post_up_message = "Opullence collector is up"    
    end
    
    config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
    end
end
