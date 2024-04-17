FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY .env.sample .env.sample
COPY poetry.lock pyproject.toml ./

# Install Poetry
RUN pip install poetry==1.8.2

# Install dependencies using Poetry
RUN poetry install


COPY . .

# Set the entry point to your app.py
ENTRYPOINT ["poetry", "run"]
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
