# this configuration is manual on the current vpc
file '/etc/network/interfaces.d/ipv6' do
  content "iface ens3 inet6 static\n address 2607:fcd0:100:4d01::ed56:84a1\n netmask 64\n gateway 2607:fcd0:100:4d01::1\n"
  notifies :restart, 'service[networking]'
end

service 'networking' do
  action :start
end
