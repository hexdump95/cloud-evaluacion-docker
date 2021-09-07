FROM python:3.9-alpine

WORKDIR /app
LABEL maintainer="Sergio Villanueva <sergiovillanueva@protonmail.com>"
EXPOSE 8000

ENV USER=user
RUN adduser -D $USER
USER $USER
ENV PATH=$PATH:/home/$USER/.local/bin

COPY --chown=$USER:$USER requirements.txt .
RUN pip install uvicorn \
-r requirements.txt
COPY --chown=$USER:$USER main.py .

CMD ["uvicorn", "main:app", "--host=0.0.0.0", "--port=8000"]
