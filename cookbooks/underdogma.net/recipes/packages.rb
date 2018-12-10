package 'apt-transport-https'

packages = [
  'apt-file',
  'awscli',
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
  url 'https://releases.hashicorp.com/terraform/0.12.0-alpha4/terraform_0.12.0-alpha4_terraform_0.12.0-alpha4_linux_amd64.zip'
  version '0.12.0-alpha4'
  mode '0755'
  extract_action 'unzip'
end

link '/usr/local/bin/terraform' do
  to '/usr/local/terraform/versions/current/terraform'
end

tar_extract 'https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz' do
  target_dir '/usr/local'
  creates '/usr/local/go/bin/go'
end

link '/usr/local/bin/go' do
  to '/usr/local/go/bin/go'
end

link '/usr/local/bin/godoc' do
  to '/usr/local/go/bin/godoc'
end

link '/usr/local/bin/gofmt' do
  to '/usr/local/go/bin/gofmt'
end
