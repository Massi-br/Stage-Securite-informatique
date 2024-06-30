terraform {
  required_providers {
    vagrant = {
      source = "bmatcuk/vagrant"
      version = "4.1.0"
    }
  }
}

provider "vagrant" {
}

resource "vagrant_vm" "my_kali" {
  vagrantfile_dir = "C:/Users/Massinissa/Desktop/vagrant-kali/vagrantconf/"

  connection {
    type        = "ssh"
    user        = "vagrant"
    password    = "vagrant" 
    host        = "127.0.0.1"
    port        = 2222
  }
  provisioner "file" {
    source      = "C:/Users/MassinissaBRAHIMI/Desktop/ansible/play.yaml"
    destination = "/home/vagrant/play.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y ansible",
      "ansible-playbook /home/vagrant/play.yaml"
    ]
  }
}
