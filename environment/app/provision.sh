
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update -y && sudo apt-get upgrade -y

# install nginx
sudo apt-get install ruby2.4 ruby2.4-dev ruby-build -y
sudo apt-get install build-essential libgmp-dev libxml2 -y
sudo apt-get install nginx -y
sudo vim /etc/nginx/nginx.conf
sudo vim /etc/nginx/conf.d/myproxy.conf

> server {
  listen 80;
  server_name development.local;

  location /my/proxy/ {
    rewrite ^/my/proxy(.*)$ /
  }

  location / {
    proxy_pass http://development.local:3000;
    proxy_redirect default;
    proxy_read_timeout 60s;
  }
}

# Install Node.js & npm
sudo apt-get update
sudo apt-get install npm -g
sudo apt-get install nodejs -y
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# Install gems
sudo gem install bundler
sudo gem install rake
sudo gem install rails

#
sudo apt-get update
sudo curl -sL https://deb.nodesource.com/setup_0.12.x
sudo apt-get install nodejs -y
sudo npm install npm
