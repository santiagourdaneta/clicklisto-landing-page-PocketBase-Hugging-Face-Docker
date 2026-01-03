FROM alpine:latest
RUN apk add --no-cache ca-certificates unzip wget
# Descargamos PocketBase para Linux (que es lo que usa Hugging Face)
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.0/pocketbase_0.22.0_linux_amd64.zip \
    && unzip pocketbase_0.22.0_linux_amd64.zip \
    && chmod +x pocketbase
# Abrimos el puerto que Hugging Face espera
EXPOSE 7860
CMD ["./pocketbase", "serve", "--http=0.0.0.0:7860"]