# Add a collector

To add a collector you need to write an ansible file with the name of your collector.
this file need to be placed in roles/collectors_provision/tasks/provisions.
you also need to create a file .sh with the name of your collector.
This file need to be placed in roles/collectors_provision/templates.

example with "trufflehog" collector:

```bash
touch roles/collectors_provision/tasks/provisions/trufflehog.yml
touch roles/collectors_provision/templates/trufflehog.sh
```

note that you must copy the .sh file to the destination /srv/bin/ (in the remote server).

for example, something like that:

```
  - name: '<you-collector-name> : install launcher'
    template:
      dest: /srv/bin/<you-collector-name>
      mode: 0755
      src: <you-collector-name>.sh
```

## install the collector

Once you have done this, There are two ways to install your collector:

 - with the default config file (all collector will be installed).
 - by creating your own .config and pass it to ansible.

### default config file

make sure you add the name of you collector in default.config
note that it must be the same name as your file in roles/collectors_provision/tasks/provisions/ but without the extension.

### custom config file

copy the default.config file and remove all the collectors that you don't want.
of course, don't forget do add the collector you have created.

when your run ansible, you need to specify the file like this:

```
-e "tools_file=my-own-config.config"
```

OR

```
--extra-vars "tools_file=my-own-config.config"
```

if this argument is not defined, default.config will be used.

