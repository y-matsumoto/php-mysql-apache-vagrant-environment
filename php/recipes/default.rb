#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service "iptables" do
    action [:stop, :disable]
end

%w{php php-common php-mbstring php-xml php-devel php-process php-cli php-pear php-mysql mysql-server}.each do |p|
	package p do
    	action :install
    end
end

# apacheのインストール CentOSの場合
package "httpd" do 
	action :install
end

# apacheのインストール
#package "apache2" do 
#	action :install
#end

# apacheの起動 CentOSの場合
service "httpd" do
    action [:start, :enable]
end

#service "apache2" do
#	action [ :enable, :start ]
#end

template "/var/www/html/index.html" do
    source "index.html.erb"
    mode 0644
end

package "vim" do
    action :install
end

