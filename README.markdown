# Dinner for One

This repository is an example of an infrastructure repo using chef-solo to manage all the nodes. All the infrastructure,
including the vagrant instances will be managed using the scripts.

## Vagrant IAAS

First step is to obtain servers. For some, that's a phone call to your ops department and a few days wait. Or, it's
launching a few new EC2 instances. We'll get to that later, for now, Vagrant will behave as our IAAS.

    vagrant up

## The "key" to Remote Management...

First thing I generally do with new infrastructure is add my public key to the servers root authorized keys list. This
allows me to do passwordless remote access.

    script/ssh-copy-id root@app.vagrant
    # enter 'vagrant' because that's roots password on all vagrant base boxes
    script/ssh-copy-id root@db.vagrant
    # test it out
    ssh root@app.vagrant

Yeah, you could have used vagrant's handy ssh helpers, but that's now how you connect to servers in the real world. Not
saying that those helpers aren't useful, it's just when you're trying to treat the vagrant instances like any other IAAS
provided server, I find it better to use the same scripts for everything.

## Convergence

Now the two servers are setup for convergence. Simply run the following:

    script/converge server1.vagrant
    script/converge server2.vagrant

Now when you ssh into them, you should see the motd changes.

## Not All Machines Are Created Equal

Vagrant baseboxes come with chef installed, so that saves a lot of time and work. Depending on how you roll out your own
infrastructure, you may need to bootstrap your machines so they are ready for 'convergence'. I've added a new node
definition for an EC2 instance I created.

    # script/ssh-copy-id unfortunately didn't work because I needed authenticate using my amazon pem.
    # Ended up ssh'ing into the server and putting my public key in manually. Will fix this soon.
    script/bootstrap ec2-175-41-172-207.ap-southeast-1.compute.amazonaws.com
    script/converge ec2-175-41-172-207.ap-southeast-1.compute.amazonaws.com
    ssh root@ec2-175-41-172-207.ap-southeast-1.compute.amazonaws.com

Sure enough, I see that the motd has been modified

