FROM centos:centos8

RUN dnf update -y
RUN dnf install cronie \
	python3-pip \
	firewalld \
	network-scripts \
	traceroute \
	-y

RUN pip3 install wheel pytest pytest-runner requests

USER root
RUN systemctl enable firewalld
