FROM python:3.10.1-slim-buster

RUN apt update

RUN apt install libblas-dev liblapack-dev gfortran libatlas-base-dev gcc g++ cmake -y

RUN pip3 install --upgrade pip

WORKDIR /app

# Create a virtualenv for the application dependencies.
RUN pip3 install --no-cache-dir virtualenv && virtualenv venv
ENV PATH /venv/bin:$PATH

# Add the `requirements.txt` file and our custom packages
ADD requirements.txt /app/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Setup jupyter extensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable execute_time/ExecuteTime

ENV PYTHONPATH="${PYTHONPATH}:/app"