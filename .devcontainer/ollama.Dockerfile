FROM ollama/ollama

VOLUME [ "$Home/ollama:/root/.ollama" ]

EXPOSE 11434

# ENTRYPOINT []