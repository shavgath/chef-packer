
# Install required plugins
required_plugins = %w( vagrant-hostsupdater vagrant-berkshelf )
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.150"
    app.vm.network "forwarded_port", guest: 8080, host: 3000 #http
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder "app", "/home/ubuntu/app"
    #app.vm.provision "shell", inline: "echo 'DB_HOST=192.168.10.150' >> .bashrc"
    app.vm.provision "chef_zero" do |chef|
      chef.add_recipe "node::default"
      #chef.nodes_path = "../Day4/cookbooks/node"
      chef.arguments = "--chef-license accept"
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.synced_folder "environment/db", "/home/ubuntu/environment"
    db.vm.provision "chef_zero" do |chef|
      chef.add_recipe "mongo::default"
      #chef.nodes_path = "../Day4/cookbooks/mongo"
      chef.arguments = "--chef-license accept"
    end
  end
end
