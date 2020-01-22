# Add a new server

## Requirement on your server

Your need to do several things on your blank server:

     - update your system
     - install a ssh server
     - add a user "collector" in the groups collector and sudo
     - set a password to collector
     - setup ssh connection by key

when you have done this, your server is ready

## Setup your server in the project

add your ip in inventory/production/hosts.yml like this:

```
collectors:
  hosts:
    "collector server 1":
      ansible_host: <YOUR IP>
      ansible_port: <YOUR SSH PORT>
     "collector server 2":
      ansible_host: <YOUR IP>
      ansible_port: <YOUR SSH PORT>
      
      ...
```


ansible-playbook -i ./inventory/production ./site.yml 
--ask-become-pass
--extra-vars "ansible_become_pass=$(pass test/root)"
add Host <yourhost1> <yourhost2>
     ForwardAgent yes

ansible-playbook -i ./inventory/production ./playbooks/provision.yml --extra-vars "ansible_become_pass=$(pass collector-192.168.1.22/root)"
