FROM python

RUN apt-get update && apt-get install -y curl ffmpeg bash && \
mkdir opa
WORKDIR opa
RUN pip install youtube-dl
COPY oper.sh oper.sh
COPY opermp4.sh opermp4.sh
RUN chmod +x oper.sh && chmod +x opermp4.sh
CMD bash