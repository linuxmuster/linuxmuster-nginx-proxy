# linuxmuster-nginx-proxy

linuxmuster.net scripts and configuration files to setup a nginx reverse proxy for docker containers (based on [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)).

To add your container simply add a nginx configuration file with extension _.conf_ to _/srv/docker/linuxmuster-nginx-proxy/conf.d_ and restart the container:  
`systemctl restart linuxmuster-nginx-proxy`  

Minimal conf example (adjust ports and hostname):  
`
server {  
    listen 443 ssl;  

    ssl_certificate           /tmp/ssl/docker.cert.pem;  
    ssl_certificate_key       /tmp/ssl/docker.key.pem;  

    location / {  
      proxy_pass http://docker.linuxmuster.lan:80;  
    }  
}
`
