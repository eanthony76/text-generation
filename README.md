# Text Generation UI Docker Container
This docker container can be used to run the text generation UI found at https://github.com/oobabooga/text-generation-webui

### Usage
- Clone the git repository and run ```docker build -t text-generation:latest``` to build your docker container (could take up to 10 minutes).
- After your container is built, run ```docker run --name <name> -p 7860:7860 -p 5000:5000 text-generation:latest``` to run your container. The UI can be found on your browser by going to localhost:7860


