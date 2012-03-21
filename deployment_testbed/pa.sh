#!/bin/bash

puppet apply --verbose --modulepath=/vagrant/puppet/puppet-modules /vagrant/puppet/base.pp
