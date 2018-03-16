# linuxmuster-nginx-proxy

linuxmuster.net scripts and configuration files to setup a nginx reverse proxy for docker containers (based on [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)).

To add your container simply place a nginx configuration file with extension _.conf_ in _/srv/docker/linuxmuster-nginx-proxy/conf.d_ and restart the container:  
`systemctl restart linuxmuster-nginx-proxy`  

Minimal conf example, the proxy ssl port _443_ will be forwarded to the container port _80_. You have to adjust the ports if necessary and insert the name of your container and the ip address of the dockerhost:  
```
  upstream <container_name> {
    server <dockerhost_ip>:80;
  }
  server {  
    listen 443 ssl;  
    ssl_certificate           /etc/nginx/certs/docker.cert.pem;  
    ssl_certificate_key       /etc/nginx/certs/docker.key.pem;  
    location / {  
      proxy_pass http://<container_name>;  
    }  
  }  
```
