# Docker PoshC2

PoshC2 is a proxy aware C2 framework used to aid penetration testers with red teaming, post-exploitation and lateral movement. This is a dockerized version of it on the top of an Ubuntu box with an entrypoint script to pass environment variables and update the main server config when running the docker image.

## Getting Started


Pull remote image

```
docker image pull cyb3rward0g/docker-poshc2:20210315
```

tag it

```
docker tag cyb3rward0g/docker-poshc2:20210315 poshc2
```

Run the Posh server

```
sudo docker run -ti --rm -p 443:443 -e PAYLOAD_COMMS_HOST=https://192.168.0.4 poshc2 posh-server
```

Run the Posh client

```
sudo docker run -ti --rm poshc2 posh
```