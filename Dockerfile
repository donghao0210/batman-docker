#Failed
FROM ubuntu:22.04

RUN apt get update -y && apt install -y git nano batctl net-tools
RUN echo 'batman-adv' | tee --append /etc/modules
RUN echo 'denyinterfaces wlan0' | tee --append /etc/dhcpcd.conf
ADD bat0 /etc/network/interfaces.d/bat0
ADD wlan0 /etc/network/interfaces.d/wlan0
ADD start-batman-adv.sh /start-batman-adv.sh

CMD ["bash", "/start-batman-adv.sh"]
