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

file '/etc/default/docker' do
  content 'DOCKER_OPTS="--icc=false --iptables=true"'
  notifies :restart, 'service[docker]'
end

service 'docker' do
  action :nothing
end
