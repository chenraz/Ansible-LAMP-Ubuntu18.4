##################################################
# Generated by phansible.com
##################################################

ANSIBLE_PATH = __dir__ # absolute path to Ansible directory on host machine
ANSIBLE_PATH_ON_VM = '/home/vagrant'.freeze # absolute path to Ansible directory on virtual machine

require 'yaml'

vconfig = YAML.load_file("#{ANSIBLE_PATH}/vagrant.default.yml")

#If your Vagrant version is lower than 1.5, you can still use this provisioning
#by commenting or removing the line below and providing the config.vm.box_url parameter,
#if it's not already defined in this Vagrantfile. Keep in mind that you won't be able
#to use the Vagrant Cloud and other newer Vagrant features.
Vagrant.require_version ">= 1.5"

# Check to determine whether we're on a windows or linux/os-x host,
# later on we use this to launch ansible in the supported way
# source: https://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby
def which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
            exe = File.join(path, "#{cmd}#{ext}")
            return exe if File.executable? exe
        }
    end
    return nil
end

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
        v.name = vconfig.fetch("vagrant_name")
        v.customize [
            "modifyvm", :id,
            "--name", vconfig.fetch("vagrant_name"),
            "--memory", vconfig.fetch('vagrant_memory'),
            "--natdnshostresolver1", "on",
            "--cpus", vconfig.fetch('vagrant_cpus'),
        ]
    end

    config.vm.box = "bento/ubuntu-18.04"

    config.vm.network :private_network, ip: vconfig.fetch('vagrant_ip')
    config.ssh.forward_agent = true
    config.vm.provision :shell, inline: "apt install -y python-cryptography python-paramiko libssl-dev"

    # If ansible is in your path it will provision from your HOST machine
    # If ansible is not found in the path it will be instaled in the VM and provisioned from there
    if which('ansible-playbook')
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.inventory_path = "ansible/inventories/dev"
            ansible.limit = 'all'
        end
    else
        config.vm.provision :shell, path: "ansible/windows.sh", args: ["default"]
    end
    
    config.vm.synced_folder "./sites", "/vagrant-nfs", type: "nfs"
    config.bindfs.bind_folder "/vagrant-nfs", "/vagrant", u: 'www-data', g: 'www-data', o: 'nonempty',perms: '0766'

end
