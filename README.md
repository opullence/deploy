# deploy
deployment repository for opullence

## Run collectors provisions

```

ansible-playbook -i ./inventory/local ./playbooks/provision.yml

```

## Install localy

you can install all the collectors locally.
They will be instlaled under /srv/ directory with user `collector` as owner.

```bash
ansible-playbook -i ./inventory/local ./playbooks/provision.yml -l local 

```

## Add a collector

look at the doc (doc/add-collector.md)