# xmrig-bash-scripts
A simple collection of bash shell scripts to manage installation, update and configuration of [xmrig cpu](https://github.com/xmrig/xmrig) across multiple hosts. 


## Download
* https://github.com/seanwhe/xmrig-bash-scripts
* Git clone with `git clone https://github.com/seanwhe/xmrig-bash-scripts`

### Prerequisites

* Ubuntu Linux (or other Debian-based distribution)
* User account with sudo privileges

### Installion

1. Change in to the cloned directory 
   `cd xmrig-bash-scripts`

2. Edit the settings file to your preference.
   `vim settings.sh`

3. Run the install script
   `./install.sh`

The install script do the following:
1. Load the settings ensuring that your user has passwordless sudo and that vm.nr_hugepages is set.
2. Stop any existing screen session runing xmrig.
3. Run apt update, upgrade, autoremove, autoclean on system.
4. Install required build dependencies.
5. Git clone xmrig source to ~/xmrig-bash-scripts/xmrig-cpui/ and change to specified branch
6. Build and install xmrig to /usr/bin
7. Start a screen named xmrig-cpu running xmrig

## Viewing mining process
`screen -r xmrig-cpu`

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/seanwhe/xmrig-bash-scripts/tags). 

## Authors

* **Sean Wheller** - *Initial work* - [seanwhe](https://github.com/seanwhe)

## CONTRIBUTING
See also the list of [contributors](https://github.com/seanwhe/xmrig-bash-scripts/CONTRIBUTORS

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to [fireice-uk](https://github.com/fireice-uk) for developing and maintaining xmrig
