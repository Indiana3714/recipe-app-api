FROM python:3.9-alpine3.13
LABEL maintainer="test.com"

ENV PYTHONUNBUFFERED 1

COPY ./app /app
WORKDIR /app
EXPOSE 8000


# Copy Poetry files
COPY ./pyproject.toml ./poetry.lock /app/

# Install Poetry
RUN apk add curl
RUN curl -sSL https://install.python-poetry.org | python3 -

# Ensure we can use "poetry xxx" commands
ENV PATH="/root/.local/bin:$PATH"

# Install non-dev dependencies to system Python
RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction --no-ansi --only main


RUN adduser --disabled-password --no-create-home django-user
USER django-user