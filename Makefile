SHELL:=/bin/bash

setup:
	wget https://github.com/htacg/tidy-html5/releases/download/5.4.0/tidy-5.4.0-64bit.deb;
	sudo dpkg -i tidy-5.4.0-64bit.deb

lint: 
	docker run --rm -i hadolint/hadolint < Dockerfile;
	tidy -e -q index.html;

build:
	docker build -t 332154536608.dkr.ecr.us-east-1.amazonaws.com/capstone .;
	# aws login command
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 332154536608.dkr.ecr.us-east-1.amazonaws.com;
	#push image
	docker push 332154536608.dkr.ecr.us-east-1.amazonaws.com/capstone:latest;

all: setup lint build