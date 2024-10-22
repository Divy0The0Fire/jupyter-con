# Use the official Python 3.10.10 image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install Jupyter Notebook
RUN pip install --no-cache-dir notebook

# Generate Jupyter configuration file
RUN jupyter notebook --generate-config

# Set the password (replace the hash with your own)
RUN echo "c.NotebookApp.password = u'sha1:yourhashedpassword'" >> /root/.jupyter/jupyter_notebook_config.py

# Expose the Jupyter Notebook port
EXPOSE 10000

# Set the command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=10000", "--no-browser", "--allow-root"]
