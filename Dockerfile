﻿FROM python:3.7-slim

RUN pip install -U pip
RUN pip install numpy==1.17.3 tensorflow==2.0.0 flask pillow

COPY app /app

# By default, we run manual image resizing to maintain parity with CVS webservice prediction results.
# If parity is not required, you can enable faster image resizing by uncommenting the following lines.
# RUN apt-get update && apt-get install -y --no-install-recommends libglib2.0-bin
# RUN pip install opencv-python-headless

# Expose the port
EXPOSE 80

# Set the working directory
WORKDIR /app

# Run the flask server for the endpoints
CMD python -u app.py
