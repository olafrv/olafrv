# sudo apt install -y gcc g++ make
NODE_MAJOR=21
install: 
	# NodeJS - https://github.com/nodesource/distributions
	sudo apt-get purge -y nodejs &&\
		sudo rm -rf /etc/apt/sources.list.d/nodesource.list &&\
		sudo rm -rf /etc/apt/keyrings/nodesource.gpg
	sudo apt autoremove
	sudo apt-get install -y ca-certificates curl gnupg
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
	echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
	sudo apt-get update
	sudo apt-get install -y nodejs
	node -v; npm version; npx -v

