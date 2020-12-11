FROM python:3.7.7-stretch

RUN apt-get update \
    && apt-get --assume-yes --no-install-recommends install \
        build-essential \
        curl \
        git \
        jq \
        libgomp1 \
        vim

WORKDIR /app

# upgrade pip version
RUN pip install --no-cache-dir --upgrade pip==20.1.1

# install poetry
RUN pip install poetry==1.0.5

# config poetry
RUN poetry config virtualenvs.in-project true
RUN poetry config virtualenvs.create true

# install python dependencies
ADD pyproject.toml .
ADD poetry.lock .

RUN poetry install --no-dev

RUN rm -rf /root/.cache/pip \
    && rm -rf /root/.cache/pypoetry/cache

ADD main.py .
