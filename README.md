# Text Generation UI Docker Container
This docker container can be used to run the text generation UI found at https://github.com/oobabooga/text-generation-webui

### Usage
- Clone the git repository and run ```docker build -t text-generation:latest``` to build your docker container (could take up to 10 minutes).
- After your container is built, run ```docker run --name <name> -p 7860:7860 -p 5000:5000 text-generation:latest``` to run your container. The UI can be found on your browser by going to localhost:7860

### Other notes
- The LLM used to run this particular app is Mistral 7B quantized down to 3-bits by TheBloke (https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/tree/main). This container is meant to run on a 4GB GPU, but if you have more compute and would like to try a different model, it will need to be added to the container at ```/text-generation-webui/models/```. You will need to add a config file and whatever .gguf file is needed.
- If you would like to run another LLM in the UI, the original oobabooga repo has detailed instructions.
- You will need to add the nvidia-docker plugin to run the container. It can be added by running ```sudo apt update && sudo apt upgrade && sudo apt-get install -y nvidia-docker2```. You may have to reload the docker daemon to get it to work.
