# Docker PoshC2

PoshC2 is a proxy aware C2 framework used to aid penetration testers with red teaming, post-exploitation and lateral movement. This is a dockerized version of it on the top of an Ubuntu box with an entrypoint script to pass environment variables and update the main server config when running the docker image.

## Getting Started

Set up local docker settings

```
curl -sSL https://raw.githubusercontent.com/nettitude/PoshC2/master/Install-for-Docker.sh | bash
```

Create Project Directory

```
mkdir /opt/PoshC2_Project

```

Pull remote image

```
docker image pull cyb3rward0g/docker-poshc2:20200417
```

tag it

```
docker tag cyb3rward0g/docker-poshc2:20200417 poshc2
```

Run the Posh server

```
sudo docker run -ti --rm -p 443:443 -v /opt/PoshC2_Project:/opt/PoshC2_Project -v /opt/PoshC2:/opt/PoshC2 -e PAYLOAD_COMMS_HOST=https://192.168.0.4 poshc2 /usr/bin/posh-server
```

Run the Posh client

```
sudo docker run -ti --rm -v /opt/PoshC2_Project:/opt/PoshC2_Project -v /opt/PoshC2:/opt/PoshC2 poshc2 /usr/bin/posh
```