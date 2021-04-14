# computervision-box

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/v6uhb0j7tmu9jyet/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/computervision-box/branch/master) |

Developer box for Computer Vision.


## Creating Vagrant Box

Copy vagrant file from `vagrant/examples/` and then create the vagrant box (you can change to `--provider=virtualbox` if you want to use Oracle VirtualBox provider):
```
$ cp -v vagrant/examples/Vagrantfile.computervision-box.fedora-33.x86_64.example vagrant/Vagrantfile.computervision-box
$ vagrant up --provider=libvirt
$ vagrant ssh computervision-box -- sudo salt-call state.highstate
```


## Installing Anaconda

Execute the following commands to install Anaconda:
```
$ vagrant ssh computervision-box
$ curl -o Anaconda3-2020.11-Linux-x86_64.sh -L https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
$ bash Anaconda3-2020.11-Linux-x86_64.sh
```

During installations, use the following answers:

| Question | Answer |
| --- | --- |
| Do you accept the license terms? | `yes` |
| Anaconda3 will now be installed into this location: /home/vagrant/anaconda3 | Press `Enter` |
| Do you wish the installer to initialize Anaconda3 by running conda init? | `no` |

After finished installations, initialize conda and disable automatic `(base)` activations:
```
$ anaconda3/bin/conda init bash
$ conda config --set auto_activate_base false
```


## Running projects

Rsync projects into the vagrant box:
```
$ vagrant ssh computervision-box -- sudo salt-call state.sls projects
```

Before building and running a project, it is recommended to create a dedicated `conda` environment. For example:
```
$ conda create --name [PROJECTNAME]
$ conda activate [PROJECTNAME]
([PROJECTNAME]) $ conda install python==3.9
```
