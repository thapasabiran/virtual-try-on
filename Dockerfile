FROM python:3.10-slim

# # Set the working directory in the container
# WORKDIR /app

# # Copy the project files into the container
# COPY .env.sample .env.sample
# COPY poetry.lock pyproject.toml ./

# # Install Poetry
# RUN pip install poetry==1.8.2

# # Install dependencies using Poetry
# RUN poetry install


# COPY . .

# # Set the entry point to your app.py
# ENTRYPOINT ["poetry", "run", "flask", "run", "--host=0.0.0.0", "--port=8080"]

# Set the working directory to /app
WORKDIR /app

# copy the requirements file used for dependencies
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY .env.sample .env.sample

# Copy the rest of the working directory contents into the container at /app
COPY . .

# Run app.py when the container launches
ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port=8080"]
