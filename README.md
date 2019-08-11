# xmrig-bash-scripts
A set of convenience scripts, written in bash, to help manage installation, configuration and update of [xmrig cpu](https://github.com/xmrig/xmrig) across multiple hosts. 


## Download
* https://github.com/seanwhe/xmrig-bash-scripts
* Git clone with `git clone https://github.com/seanwhe/xmrig-bash-scripts`

### Prerequisites

There is allot to install so the install script will do most of the heavy lifting.
At the start the expectation is that you have:
* Computer running Ubuntu 18.04 (LTS)
* User account with sudo privileges
* Installed git
* Optionally installed [xmrig-proxy](https://github.com/xmrig/xmrig-proxy)

### Agreeable

Some knowledge of:
* Linux Command Line Interface
* Linux shell `bash`

There is more to install but the install script will install the rest.

### Installation

1. Change to your user home directory.
   `cd ~`

2. Install git.
   `sudo apt install git`

3. Clone this project.
   `git clone https://github.com/seanwhe/xmrig-bash-scripts`

4. Change into the cloned directory. 
   `cd xmrig-bash-scripts`

5. Edit the settings file to your preference.
   `vim settings.sh`

6. Run the install script
   `./install.sh`

7. After install is complete. Attach to the screen session created during the installation.
   `screen -r`

### Operation

Defaults - The settings.sh contains a number of variables. With the exception of the 'xmrig' binary, which is installed to `/usr/bin/xmrig`, all files remain in the cloned project directory `~/xmrig-bash-scripts`. Any files generated while running the scripts are also created in this directory. 

During install the folder source for [xmrig cpu](https://github.com/xmrig/xmrig) is cloned to `~/xmrig-bash-scripts/xmrig-cpu/`. The `config.json` is also created in this path. 

This should work out the box, if you edit only the top section of `settings.sh` and followed the steps here.

Once you have a running xmrig then you can start playing around and tweaking to suite requirements.

What follows is a brief of the shell scripts you will find. The names are mostly self explanatory.
Comments and notes are used liberally in the scripts to help give you hints as to how it works.
The scripts are designed to be modular to promote resuse, execute exclusion and standalone execution.

* build.sh - clones xmrig to ``~/xmrig-bash-scripts`/xmrig-cpu`, configures, builds and copies xmrig to `/usr/bin/`
* config.sh - contains variables that aid in defining the values for the attributes found in config.json.
* crontab.sh - installs a cron to start and a cron to stop at specific times (Can be commented out of install if desired).
* crontab-off - removed the users crontab created during install.
* crontab-on.sh - redefines the users crontab as created during install.
* depends.sh - installs dependancies required by xmrig and these scripts.
* functions.sh - a collection of functions used in various of the scripts.
* install.sh - the main entry point when first installing.
* maintenance.sh - performs apt update, upgrade, autoremove and autoclean operations.
* settings.sh - contains variables used by these scripts.
* start.sh - starts xmrig in a screen session.
* stop.sh - stops xmrig screen session.

### Viewing the log
Default of the start script is to create a screen session named 'xmrig-cpu'.
This can be changed in the settings script if required.
To view the log after installation is finished or after running the start script, used the following command:
`screen -r xmrig-cpu`

### Updating
A simple `git update` in `~/xmrig-bash-scripts` will update these scripts.

The install script can be run at any time to update the xmrig source found `~/xmrig-bash-scripts/xmrig-cpu`. 
The branch checkout is taken from the `_XMRIG_BRANCH` variable in `settings.sh`.

A script named update.sh is provided to perform both these steps in a single command.

## Reporting issues

[xmrig cpu](https://github.com/xmrig/xmrig) and [xmrig bash scripts](https://github.com/seanwhe/xmrig-bash-scripts.git) are different projects run by different people. 

While the developers of both projects may be seen interacting with one another on either project, we ask that you report issues to the respective projects.
In other words, post issues for:
* xmrig, the Monero (XMR) CPU miner, over at [xmrig issues tracker](https://github.com/xmrig/xmrig/issues)
* xmrig-bash-scripts, these conveniece scripts, over at [xmrig-bash-scripts](https://github.com/seanwhe/xmrig-bash-scripts/issues)

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/seanwhe/xmrig-bash-scripts/tags). 

## Contributing
Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

See also the list of [contributors](https://github.com/seanwhe/xmrig-bash-scripts/CONTRIBUTORS)

## Authors

* **Sean Wheller** - *Initial work* - [seanwhe](https://github.com/seanwhe)

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to [fireice-uk](https://github.com/fireice-uk) for developing and maintaining [xmrig products](https://xmrig.com/).
