setup:
    wget https://github.com/htacg/tidy-html5/releases/download/5.4.0/tidy-5.4.0-64bit.deb
    sudo dpkg -i tidy-5.4.0-64bit.deb

lint: 
	docker run --rm -i hadolint/hadolint < Dockerfile
	tidy -e -q index.html

build:
	docker build -t $1/capstone .
	# aws login command
	docker push $1/capstone:latest