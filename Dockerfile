# Start with a base image that includes CUDA, for example, the official CUDA 11.2 runtime Ubuntu image
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

# Set a label to describe the Dockerfile
LABEL maintainer="eanthony"

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    python3 \
    python3-venv \
    pip


RUN git clone https://github.com/oobabooga/text-generation-webui \
    && cd text-generation-webui \
    && pip install -r requirements.txt \
    && pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

RUN mkdir text-generation-webui/models/mistral-7b-instruct-K \
    && cd text-generation-webui/models/mistral-7b-instruct-K \
    && curl -L https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/resolve/main/config.json?download=true --output config.json \ 
    && curl -L https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/resolve/main/mistral-7b-instruct-v0.1.Q3_K_S.gguf?download=true --output mistral-7b-instruct-v0.1.Q2_K.gguf

WORKDIR /text-generation-webui

EXPOSE 7860

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
