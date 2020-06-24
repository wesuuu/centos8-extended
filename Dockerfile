FROM centos:centos8

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum module enable -y nodejs
RUN dnf update -y
RUN dnf groupinstall 'Development Tools' -y
RUN dnf install \
		python3-pip \
		traceroute \
		gcc \
		python3-devel \
		rsyslog \
		git \
		wget \
		curl \
		bash-completion \
		lsof \
		net-tools \
		vim \
		nano \
		nodejs \
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
		oo-tools

# jq
RUN wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
RUN chmod +x ./jq
RUN cp jq /usr/bin
RUN rm -rf jq

# Chromedriver
RUN wget https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip -O /tmp/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver_linux64.zip
RUN mv chromedriver /bin/