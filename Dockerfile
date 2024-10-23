# Use the official Python 3.10.10 image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install Jupyter Notebook and the JupyterLab extension
RUN pip install --no-cache-dir notebook

# Install OpenSSL to generate hashed passwords
RUN apt-get update && apt-get install -y openssl

# Expose the Jupyter Notebook port
EXPOSE 10000

# Create a hashed password using OpenSSL for '123'
RUN python3 -c "from notebook.auth import passwd; print(passwd('123'))" > /root/.jupyter/password_hash

# Set the command to start Jupyter Notebook with authentication
CMD jupyter notebook --ip=0.0.0.0 --port=10000 --no-browser --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password=$(cat /root/.jupyter/password_hash) \
    --NotebookApp.notebook_dir='/app'
