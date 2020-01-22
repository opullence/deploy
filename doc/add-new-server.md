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

```yaml
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


To enables forwarding keys into ssh-agent, add the following line to ~/.ssh/config  

```
add Host <yourhost1> <yourhost2>
     ForwardAgent yes
```

Thanks to this, you don't have to create / copy private key on remote machine.  
Don't forget to change `<yourhost*>` by your host ip.  
