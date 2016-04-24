index.html: proposal.html node_modules
	ecmarkup "$<" "$@" --css ecmarkup.css --js ecmarkup.js

node_modules:
	npm install
