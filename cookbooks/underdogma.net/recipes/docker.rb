package 'btrfs-tools'

execute 'docker fs file' do
  command '/bin/dd if=/dev/zero of=/var/lib/docker.fs bs=1M count=4000'
  creates '/var/lib/docker.fs'
  notifies :run, 'execute[docker fs]', :immediately
end

execute 'docker fs' do
  command '/sbin/mkfs.btrfs /var/lib/docker.fs'
  action :nothing
end

mount '/var/lib/docker' do
  device '/var/lib/docker.fs'
  fstype 'btrfs'
end

apt_repository 'docker' do
  uri          'https://apt.dockerproject.org/repo'
  distribution 'ubuntu-trusty'
  components   ['main']
  trusted      true
end

package 'docker-engine'

execute 'install docker-compose' do
  command 'curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose'
  creates '/usr/local/bin/docker-compose'
end

cookbook_file '/usr/local/bin/docker-proxy.sh' do
  action :create
  source 'docker-proxy.sh'
  mode   '0755'
end
