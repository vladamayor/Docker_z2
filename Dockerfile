FROM python:3.10

COPY ./stocks_products/requirements.txt /src/requirements.txt

RUN pip3 install --no-cache-dir -U -r /src/requirements.txt

COPY . /src
WORKDIR src
EXPOSE 8000

RUN python stocks_products/manage.py makemigrations
RUN python stocks_products/manage.py migrate
CMD ["python3", "-u", "stocks_products/manage.py", "runserver", "--noreload","0.0.0.0:8000"]