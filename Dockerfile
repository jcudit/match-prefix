FROM debian:latest
RUN apt-get update && apt-get install -y jq
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
