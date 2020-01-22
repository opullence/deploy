# deploy
deployment repository for opullence

## Vagrant 

A default vagrant file will create the vm and run the two ansible tasks.    
It's just for testing purpose. You can run it with a simple:  

```bash
vagrant up
```

## Init collector's server

> :warning: **If you don't want to deploy locally**:  
> please specify it by adding `-l <HOSTS_NAME>`  
> where HOSTS_NAME is the name setted in `inventory/production/hosts.yml`   
the user password will be asked. It's used to perform some installs.  

```bash
ansible-playbook -i ./inventory/production ./site.yml --ask-become-pass
```

## Run collectors provisions

> :warning: **If you don't want to deploy locally**:  
> please specify it by adding `-l <HOSTS_NAME>`  
> where HOSTS_NAME is the name setted in `inventory/production/hosts.yml`  
the user password will be asked. It's used to perform some installs.  

```bash
ansible-playbook -i ./inventory/production ./playbooks/provision.yml --ask-become-pass
```

## Run collectors provisions locally

you can install all the collectors locally.  
They will be instlaled under /srv/ directory with user `collector` as owner.

```bash
ansible-playbook -i ./inventory/local ./playbooks/provision.yml -l local

```

## Add a collector

look at the doc (doc/add-collector.md)

## Add a server

look at the doc (doc/add-new-server.md)