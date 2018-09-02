FROM python

RUN apt-get update && apt-get install -y curl ffmpeg bash && \
mkdir opa
WORKDIR opa
RUN pip install youtube-dl
COPY oper.sh oper.sh
COPY operavi.sh operavi.sh
RUN chmod +x oper.sh && chmod +x operavi.sh
CMD bash