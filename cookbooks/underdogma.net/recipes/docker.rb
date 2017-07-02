packages = [
  'btrfs-tools',
  'docker-compose',
  'docker.io',
  'vim-syntax-docker',
]

package packages

service 'docker' do
  action [:enable, :start]
  supports :status => true, :restart => true
end

cookbook_file '/usr/local/bin/docker-proxy.sh' do
  action :create
  source 'docker-proxy.sh'
  mode   '0755'
end
