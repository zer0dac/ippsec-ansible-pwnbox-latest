# ippsec-ansible-pwnbox-latest


Updated ippsec-pwnbox ansible for the latest version


fixed errors: 

=> Ansible Updated error:

ERROR! [DEPRECATED]: ansible.builtin.include has been removed. Use include_tasks or import_tasks instead. This feature was removed from ansible-core in a release after 2023-05-16. Please update your playbooks.

=> Path Could Not found of burpsuite jar error:

Executing bash script to Download CA Certificate 

=> rsyslog not installed error

=> ens33 not found error on terminal, changed to enp0s3 on .bashrc, if your interface name is different you have to change enp0s3 string to your interface name, to see it use ifconfig.






SETUP:

1- Download the Hackthebox parrot version -> https://deb.parrot.sh/parrot/iso/6.0/Parrot-htb-6.0_amd64.iso

2- Install system to Virtualbox via any username

3- open a terminal:
$sudo visudo
scroll down to the page and add this line bottom of the file

<your_username> ALL=(ALL) NOPASSWD:ALL

4- open a new terminal and test it if sudo su works without a password.

5- Run below commands:

$sudo apt update && sudo apt full-upgrade

$git clone https://github.com/zer0dac/ippsec-ansible-pwnbox-latest.git

$cd ippsec-ansible-pwnbox-latest

$pip3 install ansible --break-system-packages

$ansible-galaxy install -r requirements.yml

$ansible-playbook main.yml

(in the burpsuite part, it will pop-up screen because its your first burpsuite opening, open burpsuite with default settings, I designed it that way because if some java version change, this ansible still will be usable)

then open a new terminal > right click > profiles > video

reboot your system, your system is ready to pwn HTB boxes on ippsec's environment.
