user 'matt' do
  shell '/bin/bash'
  home '/home/matt'
  password '$1$xyz$7WhDoWubIzwohvOfm2IYH.'
  supports :manage_home => true
end

group 'docker' do
  action :modify
  append true
  members 'matt'
end

group 'sudo' do
  action :modify
  append true
  members 'matt'
end

ssh_authorize_key 'matt@underdogma.net' do
  key 'AAAAB3NzaC1yc2EAAAABIwAAAQEAxnahRdhIq65Mep/6XDaYDpvjFUPwrYZoRqa0B2dtcI+BADxuQV+cmchdJau8gYZdbt066uO70rNfe+WsNXzmox5GVy56cka2XwPQVOQcrp08Qf9vWA96OStK3CfSFwqPY9oHl47yaKedAK7uS47aqjb+0r959RylK8Q8WlRfJw7FDjTWknjnqDOY/WA432d1ZvzJbQeVvAvN+7kLdFIGMUj2ZPVLyIX25xqawp7F7L/HYcrWhsDox/ttN/qcHE5kWhOzfb6ghFfstZ3sgj/MCCspMzQ1B943kWxWnrfe87Lbpl9MaIUnOicilcm+MymNj+DRqMfgE5LATx1ktLgFIw=='
  user 'matt'
end

# this should always be last
user 'root' do
  action :lock
end
