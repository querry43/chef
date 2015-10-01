apt_repository 'security-ubuntu-multiverse' do
  uri          'https://storage.googleapis.com/download.dartlang.org/linux/debian'
  distribution 'stable'
  components   ['main']
  trusted      true
end

packages = [
  'apt-file',
  'dart',
  'docker.io',
  'finger',
  'gcc',
  'git',
  'lxc',
  'ntp',
  'supervisor',
  'vim-nox',
  'vim-scripts',
  'vim-syntax-go',
]

package packages

gem_package 'ruby-shadow' do
  gem_binary '/usr/bin/gem2.0'
end
