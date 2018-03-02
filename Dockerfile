FROM python:2.7.14-alpine3.7

MAINTAINER Steve McQuaid "steve@stevemcquaid.com"

WORKDIR /app

# Cache requirements so that you only install when things change
ADD requirements.txt /app
RUN pip install -r requirements.txt

# Copy rest of the app into container
COPY . /app

ENTRYPOINT ["python"]

CMD ["app.py"]
