supervisord_program 'dynamic-proxy' do
  autostart true
  autorestart true
  command 'docker run --name dynamic-proxy -a stdout -a stderr --rm=true -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock:ro qrry/dynamic-proxy'
end

supervisord_program 'underdogmadotnet' do
  autostart true
  autorestart true
  command 'docker run --name underdogmadotnet -a stdout -a stderr --rm=true -e VIRTUAL_HOST=www.underdogma.net qrry/underdogmadotnet'
end

supervisord_program 'slicerserver' do
  autostart true
  autorestart true
  command 'docker run --name slicerserver -a stdout -a stderr --rm=true -e VIRTUAL_HOST=slicer.underdogma.net -e PROXY_PORT=5000 qrry/slicerserver'
end
