# Use the official Python 3.10.10 image
FROM python:3.10.10

# Set the working directory in the container
WORKDIR /app

# Install Jupyter Notebook
RUN pip install --no-cache-dir notebook

# Expose the Jupyter Notebook port
EXPOSE 8888

# Set the command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]