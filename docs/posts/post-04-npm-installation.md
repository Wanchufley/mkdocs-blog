---
date:
    created: 2025-05-09
tags:
    - configuration
    - docker
    - linux
    - network
slug: npm-installation
---
# **Local and free SSL certificates for your services using docker :whale:**

I am going to show you how to install NPM using docker and configure it to serve your SSL certificates.

![npm.png](assets/img/npm.png)

<!-- more -->

## :one: Create your docker compose file &nbsp; :whale: :page_with_curl:
This guide preassumes that you already have Docker installed and configured in your system. So we are going straight to the point here, I use the following folder structure to organize my docker services:  

```bash title="Folder Structure"
/home
└── user
    ├── docker
    │   ├── service1
    │   │   └── data
    │   ├── service2
    │   │   └── data
    │   └── ... (other services)
    └── docker-compose
        ├── service1
        │   └── docker-compose.yaml
        ├── service2
        │   └── docker-compose.yaml
        └── ... (other services)

```
This means that we are going to create a folder named `docker-compose/npm` and inside we will create `docker-compose.yaml` and copy the following code:

```yaml title="docker-compose.yaml" linenums="1"
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    container_name: npm
    restart: unless-stopped
    ports:
      # These ports are in format <host-port>:<container-port>
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
      # Add any other Stream port you want to expose
      # - '21:21' # FTP

    environment:
      # Uncomment this if you want to change the location of
      # the SQLite DB file within the container
      # DB_SQLITE_FILE: "/data/database.sqlite"

      # Uncomment this if IPv6 is not enabled on your host
       DISABLE_IPV6: 'true'
       TZ: Europe/Amsterdam

    volumes:
      - /home/serveradmin/docker/npm/data:/data
      - /home/serveradmin/docker/npm/letsencrypt:/etc/letsencrypt
    
    networks:
      - proxy

    healthcheck:
      test: ["CMD", "/usr/bin/check-health"]
      interval: 10s
      timeout: 3s

networks:
  proxy:
    external: true
```
As you can see, although a bit lengthy, the compose file is pretty straight forward, we are chosing the image, exposing the container's necessary ports, setting some variables, setting the persistent data directories, adding it to the proxy network and adding a healthcheck.

!!! warning "Please note!"

    You don't need to manually create the folders that we are stating in the volumes section, they will be automatically created when we run the compose up. However we do deed to create the proxy network by running the following command in our docker host before we start the service: `docker network create <network-name>`

---

## :two: Deploy the service &nbsp; :airplane:

Now we are on the possition to be able to deploy the service, and is as easy as making sure that you are inside the folder where your docker-compose file is located, in my case:  
`/home/user/docker-compose/npm` and run: `docker compose up -d`

---

## :three: Access the  NPM dashboard for the first time! &nbsp; :newspaper: 

Once we have the service running without any errors, you can go in Portainer and look for the container and press the logs icon, it will pop up the logs screen and you can see if there were any errors while deploying. If everything was ok, now you should be able to go to the IP address of your Docker host in port 81 and you should be greeted with NPM's login screen. The default login is: `admin@example.com` `changeme`. Once you login go straight to settings and change the user and the password to one of your own and we are done with this step.

---

## :four: Set up everything in Cloudflare's Dashboard &nbsp; :cloud:

Now, to have valid SSL certificates, you will need a valid domain. You can buy it anywhere you want, but this guide will be using a Cloudflare domain so if you want to follow everything step by step I would recommend going with that, otherwise if you already have one available or you are comfortable buying from a different one please go ahead, the steps will not vary that much it all depends on the GUI of each one.<br />
<br />Go to your Cloudflare's dashboard and you should see your domain, click on it and now you should have a panel on your left hand side and one of the options has to be DNS, go ahead and click on it and you should be taken to a page where you can manage all things related to the DNS configuration of your domain. What we ultimately need from here is:

- An A record pointing your domain to the local IP address of your docker host. 
- A CNAME record with a wildcard for your services subdomain `(ex. *.yourdomain.com)` where the asterisk eventually will be anything that you want to add before  your domain (ex. npm.yourdomain.com)
- And the last thing is that you create a token that we will use to get the valid SSL certificates from Cloudflare using Let's Encrypt in NPM. 

To get this API token you can go to your Cloudflare's profile on the top right corner and you should see an option for tokens, choose `Create Token > Edit Zone DNS > Include Specific Zone > your domain`.

!!! warning "Please!"

     Make sure to copy and keep it somewhere safe as this will never be shown again.

---

## :five: Create Proxy Hosts and generate certificates &nbsp; :pencil2: :white_check_mark: 

If you already have everything from the previous step ready now we can go ahead and put all puzzle pieces together. I should also say now that I am pre assuming that you have an instance of Pihole so we can later add our own custom DNS records to be resolvable. Go to the NPM dashboard and click on `Proxy Hosts > Add Proxy`, this should pop a form to add your first proxy:

- Choose the name for it, in this case I will start with NPM's dashboard itself, so write put something like: npm.yourdomain.com
- Choose if the service is HTTP or HTTPS, put the IP address and the port of the service, in this case your Docker host IP and the port 81, which is the one we specified in the docker compose file for NPM dashboard to use and then click save.
- Now the proxy is configured but it is still not using the SSL certificates because we haven't pulled them yet. Go to the SSL certificates section and click on Add SSL Certificate and toggle the use DNS challenge option, choose your provider, in our case Cloudflare, and write your Cloudflare's login email and the API token the we generated before agree and save. After that wait a few seconds and you should be greeted with you certificate. Remember that the domains that we want to generate the certs for are your domain and the wildcard of your domain like we mention before.
- Go back to your proxies and click on edit the one that we created before and its SSL section choose which certificate you want to use, you will see the option of the one we generated just now, click and save it.

---

## :six: Add it as a Local DNS Record in Pihole &nbsp; :page_facing_up:

Now go to your Pihole's dashboard and click on `Settings > Local DNS Records` and add a your NPM domain `(ex. npm.yourdomain.com)` and point it to your NPM IP address which in this case is the same as your Docker host.<br /> 
<br />To add new domains to NPM now you only need to add them in the Proxy Hosts section following the same rules as before but without the need to create anymore certificates as you can reuse your thanks to the wildcard we used and then adding the record to your Pihole instance.
