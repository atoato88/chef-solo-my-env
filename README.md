# Summary
Build my environment in linux.  
So far, main target distribution is Ubuntu.  

# Usage
1. clone this repository
   <pre>
   git clone https://github.com/atoato88/chef-solo-my-env.git
   </pre>
1. install chef-solo command
1. copy all files to /var/chef-solo
   <pre>
   sudo mkdir /var/chef-solo
   sudo cp -a /path/to/chef-solo-my-env/* /var/chef-solo
   </pre>
1. edit parameter files
  - edit /var/chef-solo/data_bags/param/my_env.json
1. run chef-solo
   <pre>
   sudo chef-solo -c /var/chef-solo/solo.rb -j /var/chef-solo/node.json
   </pre>

