FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .
COPY .env.sample .env

# Install Poetry
RUN pip install poetry==1.8.2

# Install dependencies using Poetry
RUN poetry install

# Expose port 8080
EXPOSE 8080

# Set the entry point to your app.py
ENTRYPOINT ["poetry", "run", "flask", "run", "--host=0.0.0.0", "--port=8080"]