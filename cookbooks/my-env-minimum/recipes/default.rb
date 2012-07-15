#
# Cookbook Name:: my-env-minimum
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "my-env-minimum::host_settings"

Chef::Log.info("Start provisioning")
my_env = data_bag_item('param', 'my_env')
home = ENV['HOME']
#p home

Chef::Log.info("install essential commands")
["openssh-server", "build-essential","exuberant-ctags","byobu","git"].each do |pkg|
  package pkg
end

Chef::Log.info("configure git information")
bash "configure_git" do
  #user "root"
  #cwd "/tmp"
  code <<-EOH
   git config --global core.editor #{my_env['git']['editor']}
   git config --global user.name #{my_env['git']['name']}
   git config --global user.email #{my_env['git']['email']}
  EOH
end

Chef::Log.info("install vim and build its environment")
package "vim" do
  action :install
end

git home + "/.vim/bundle/vundle" do
  repository "https://github.com/gmarik/vundle.git"
  reference "master"
  action :checkout
end

git home + "/vim_work" do
  repository "git://gist.github.com/1199465.git"
  reference "master"
  action :checkout
end

bash "create .vimrc and BundleInstall" do
  ignore_failure true #this is dprecated way. so far, run it forcedly.
  code <<-EOH
    mv #{home}/vim_work/.vimrc #{home}/
    rm -rf #{home}/vim_work
    echo :BundleInstall | vi
  EOH
end
