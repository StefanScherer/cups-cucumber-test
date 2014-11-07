# cups cucumber test

I just wanted to play a little with [vagrant-cucumber](https://github.com/scalefactory/vagrant-cucumber) in a multi VM environment.

## Install Vagrant plugins

First we need two Vagrant plugins. Install them with the following commands.

```bash
vagrant plugin install vagrant-multiprovider-snap
vagrant plugin install vagrant-cucumber
```

## Create the VMs

Now create the two VMs `spooler` and `client` that are connected to each other with a private network 192.168.33.x. You may add `--provider=virtualbox` if you like, these plugins work both with VMware Fusion and VirtualBox.

```bash
vagrant up
```

## Run the cucumber tests

Now comes the interesting part. Run the cucumber tests with this command.

```bash
vagrant cucumber features/lpr.feature
```

On the first run the plugin will create snapshots for each VM.
Then it will run each scenario with this snapshot and reverts to it so every time you have clean VMs.
