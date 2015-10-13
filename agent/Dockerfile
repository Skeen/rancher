## ARMv7 Ubuntu
FROM armv7/armhf-ubuntu:14.04.2
MAINTAINER Emil 'Skeen' Madsen <sovende@gmail.com>


RUN apt-get update
RUN apt-get install --no-install-recommends -y \
     arptables \
     bridge-utils \
     ca-certificates \
     curl \
     iptables \
     libaio1 \
     python-eventlet \
     python-minimal
RUN curl -s https://bootstrap.pypa.io/get-pip.py > get-pip.py && python get-pip.py && rm get-pip.py
RUN pip install cattle docker-py 
RUN apt-get install -y --no-install-recommends libssl-dev python-dev libffi-dev gcc &&\
    pip install --upgrade requests[security]==2.7.0 &&\
    apt-get remove -y --purge python-dev libffi-dev libssl-dev gcc && apt-get autoremove -y

## JQ
RUN apt-get install -y --no-install-recommends jq

## DOCKER
RUN curl -s -L http://launchpadlibrarian.net/216286290/libapparmor1_2.10-0ubuntu6_armhf.deb > libapparmor.deb
RUN dpkg -i libapparmor.deb

RUN curl -s -L http://launchpadlibrarian.net/211914968/docker.io_1.6.2~dfsg1-1ubuntu3~14.04.1_armhf.deb > docker.io.deb
RUN dpkg -i docker.io.deb

RUN curl -s -L https://github.com/rancherio/thin-provisioning-tools/releases/download/rancher-v0.1/pdata_tools > /usr/bin/pdata_tools; chmod +x /usr/bin/pdata_tools
RUN apt-get install -y --no-install-recommends conntrack

RUN apt-get install -y --no-install-recommends socat

COPY util-linux/nsenter /bin/nsenter

RUN mkdir -p /var/lib/cattle /var/lib/rancher
COPY register.py resolve_url.py agent.sh run.sh /
ENTRYPOINT ["/run.sh"]
LABEL "io.rancher.container.system"="rancher-agent"
ENV RANCHER_AGENT_IMAGE rancher/agent:v0.8.2
