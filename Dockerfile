FROM centos:centos8

RUN dnf update -y
RUN dnf install cronie \
	python3-pip \
	firewalld \
	network-scripts \
	traceroute \
	gcc \
	python3-devel \
	chrony \
	rsyslog \
	git \
	-y

RUN pip3 install wheel \
		pytest \
		pytest-runner \
		requests \
		elastalert \
		notebook \
		pandas \
		numpy \
		yfinance \
		matplotlib \
		git+https://github.com/wuykimpang/oo-tools.git@master

RUN systemctl enable firewalld
