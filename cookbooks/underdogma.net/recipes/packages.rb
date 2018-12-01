package 'apt-transport-https'

packages = [
  'apt-file',
  'bc',
  'finger',
  'gcc',
  'git',
  'letsencrypt',
  'lxc',
  'ntp',
  'openssh-server',
  'silversearcher-ag',
  'supervisor',
  'vim-nox',
  'vim-scripts',
]

package packages

gem_package 'config_curator'
gem_package 'ruby-shadow'

archive 'terraform' do
  url 'https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip'
  version '0.11.10'
  mode '0755'
  extract_action 'unzip'
end

link '/usr/local/bin/terraform' do
  to '/usr/local/terraform/versions/current/terraform'
end
