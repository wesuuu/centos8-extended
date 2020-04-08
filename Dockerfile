FROM centos:centos8

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum module enable -y nodejs
RUN dnf update -y
RUN dnf groupinstall 'Development Tools' -y
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
	wget \
	curl \
	bash-completion \
	lsof \
	net-tools \
	vim \
	nano \
	-y \
	nodejs

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

# install go https://linuxize.com/post/how-to-install-go-on-centos-7/
RUN wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz
RUN tar -C /usr/local/ -xzf go1.14.linux-amd64.tar.gz
ENV PATH ${PATH}:/usr/local/go/bin
RUN rm -rf *.gz

# install jq
# jq
RUN wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
RUN chmod +x ./jq
RUN cp jq /usr/bin
RUN rm -rf jq
