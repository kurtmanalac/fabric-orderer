FROM hyperledger/fabric-orderer:3.1.1
USER root
RUN apt-get update && apt-get install -y curl jq unzip && apt-get clean

RUN mkdir -p /app/data/orderer

ENV ORDERER_FILELEDGER_LOCATION=/app/data/orderer

WORKDIR /app
COPY enroll-orderer.sh /app/enroll-orderer.sh
RUN chmod +x /app/enroll-orderer.sh
CMD ["/app/enroll-orderer.sh"]