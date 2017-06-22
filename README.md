# P4 Time-Stamping Simulation

## Some Background First
In our project we add a few time sampling features to the behavioral model of the P4 code.
In addition we created a simulation network model that demonstrates the benefits of the meantioned features.
Specifically we use the new functionality to exhibit a round-robin like routing, that helps us load balance the system, in order to increase packet throughput.

#### Before Getting Started
This simulation was run on Ubuntu 14.04 and on Mininet 2.2.2. It should work on later versions as well.


## Topology
The topology we use in our simulation network is as follows : ![Topology](https://github.com/MichaelBun/time_stamping_simulation_P4/blob/master/topology-resized.jpg)

## Installation

1.  Run: `sudo apt-get install python-pip` and `sudo apt-get install git`
2.  Select or create a directory for the project and change current directory to it using the terminal
3.  Run: `git clone https://github.com/MichaelBun/behavioral-model bmv2` and `git clone https://github.com/MichaelBun/p4c-bm p4c-bmv2`
    we are cloning the P4 required files and its behavioral model. Please notice, the directories must be in the same parent directory.
4.  Enter the `p4c-bmv2` directory, and run: `sudo pip install -r requirements.txt`
5.  Return to the parent directory and move to the `bmv2` directory
    Run the following scripts by order (add execution permission if needed):
	 - `install_deps.sh`
	 - `autogen.sh`
	 - `configure`
	 -  Use`make` to build the code
6.	From the directory containing `bmv2` and `p4c-bmv2`, run: ```git clone https://github.com/MichaelBun/time_stamping_simulation_P4.git tss```
7.  Install Mininet (skip this part if you already have the newest Mininet version installed). From the desired location, run by order:
	 - `git clone git://github.com/mininet/mininet`
	 - `mininet/util/install.sh`
8.  Install the `scapy`, `thrift`, and `networkx` python packeges, running: `sudo pip install scapy thrift networkx`
9.  Install `iperf` using: `sudo apt-get install iperf`

## Running the Simulation
1. Move to the `tss/simulation` directory, and run the script `run_demo.sh` (add execution permission if needed).
2. Check if the system topology is connected using `h1 ping h2`. If you see that packets are transmitted between the hosts you can move on to the next step
3. Inside the mininet command prompt open a terminal for hosts 1 and 2 using : `xterm h1 h2`
4. Run on host 1: `iperf -su -i -1`, and on host 2: `iperf -c 10.0.0.1 -u -b 10m` (**See note 1**). All of the parameters must be set before running the run_demo.sh script (Before starting the mininet environment)
5. When you are done, you must exit the Mininet environment using `exit` in the mininet promt (**See note 2**)

#### Notes
1. The bandwidth can be changed in the topo.py file, and the time periods for routing in each path can be changed in the `commands1.txt` for the first switch and in the `commands4.txt` for the fourth switch

2. If Mininet was closed improperly, please use `sudo mn` before doing anything else to clean up any residue left by the Mininet software

## Credits
This project was built by Michael Bunin and Elad Galili (undergrad students in the Technion - Israel Institute of Technology) for their BSc degree with the supervision of Tal Mizrahi, PhD, in association with Marvell Israel.

Our system is based in the source routig example from the SIGCOMM 2015 P4 tutorial, and our switch code is based on the P4 simple router example.
