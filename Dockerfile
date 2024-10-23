# Use the official Python 3.10.10 image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install Jupyter Notebook
RUN pip install --no-cache-dir notebook

# Install OpenSSL to generate hashed passwords
RUN apt-get update && apt-get install -y openssl

# Expose the Jupyter Notebook port
EXPOSE 10000

# Generate a hashed password for '123' using OpenSSL
RUN echo "hello:$(openssl passwd -6 123)" > /root/.jupyter/jupyter_password

# Set the command to start Jupyter Notebook with authentication using the hashed password
CMD jupyter notebook --ip=0.0.0.0 --port=10000 --no-browser --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password=$(cat /root/.jupyter/jupyter_password | cut -d: -f2) \
    --NotebookApp.notebook_dir='/app'
