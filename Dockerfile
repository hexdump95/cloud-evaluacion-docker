FROM python:3.9-alpine

WORKDIR /app
LABEL maintainer="Sergio Villanueva <sergiovillanueva@protonmail.com>"
LABEL org.opencontainers.image.source="https://github.com/hexdump95/cloud-evaluacion-docker"
EXPOSE 8000

COPY . .

ENV USER=user
RUN adduser -D $USER
USER $USER
ENV PATH="${PATH}:/home/${USER}/.local/bin"
RUN pip install --user uvicorn \
-r requirements.txt

CMD ["uvicorn", "main:app", "--host=0.0.0.0", "--port=8000"]
