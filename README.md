Vagrant Manifests
=================

These manifests are the result of two days worth of learning. I'm guessing large
portions of these manifests might be candidates for CSI: Vagrant, were there such a
site. Pull requests, comments, and constructive ridicule are welcome.

There are two separate manifests included in this project.  One is a test bed/POC 
for provisioning personal and commercial work servers, and the other is the 
result of following the Vagrant [Getting
Started](http://vagrantup.com/docs/getting-started/index.html) guide.

devbox
------

The devbox manifest is the one I'm tweaking for personal and work servers.  This
is the project where I've made use of a few exploratory puppet modules [I've
thrown together](https://github.com/jeremykendall/puppet-modules). In order to
provision a server using the devbox manifest, you'll want to clone this project
and then `git submodule init` and `git submodule update`.  This assumes you've
[installed and configured Vagrant
properly](http://vagrantup.com/docs/getting-started/index.html).

If I've done my job properly, you should be able to run `vagrant up` in the
devbox directory and end up with an Ubuntu 11.10 box with

* php5
* apache2
* devbox.dev vhost
* i.php (which calls `phpinfo()`) in `/var/www`

Once the box is up and running, you should be able to view the phpinfo page at
[http://192.168.33.10/i.php](http://192.168.33.10/i.php).

If you add `192.168.33.10   devbox.dev` to your `/etc/hosts` file, you should be
able to visit [http://devbox.dev](http://devbox.dev) in your browser and see my
ever so creative `Hello, devbox.dev` message.

vagrant_guide
-------------

Nothing exciting here.  If you follow the Vagrant [Getting
Started](http://vagrantup.com/docs/getting-started/index.html) guide and use the
Puppet provisioning example, you should end up with pretty much the same thing.

Credits
-------

I couldn't have gottent his far without a lot of help from friends,
documentation, and blog posts.  Thanks especially to [Christ
Hartjes](http://twitter.com/grmpyprogrammer) for getting me pointed in the right
direction.

Following is a list of posts and reference material I used to put this project
together.  Any failings in this project are mine and not the result of the
excellent material I was working from.

* [Vagrant Virtualised Dev
  Environments](http://nefariousdesigns.co.uk/vagrant-virtualised-dev-environments.html)
* [Getting Started with
  Vagrant](http://vagrantup.com/docs/getting-started/index.html)
* Puppet Labs excellent [Learning Puppet](http://docs.puppetlabs.com/learning/)
  documentation
* I picked up a few things from the [Puppet
  CookBook](http://puppetcookbook.com/)
* I referred to [How to create a VM with PHP 5.4 using Vagrant and
  Puppet](http://blog.vandenbrand.org/2012/03/06/how-to-create-a-vm-with-php-5-4-using-vagrant-and-puppet/)
  for yet another example of using Vagrant and Puppet in real life.
