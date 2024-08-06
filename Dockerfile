# Use an official Debian runtime as a parent image
FROM debian:latest

# Update package list and install necessary packages
RUN apt update && apt upgrade -y && \
    apt install -y git curl python3

# Install pip using get-pip.py
RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    ls -l get-pip.py && \
    python3 get-pip.py --force-reinstall && \
    rm get-pip.py

# Create and set the working directory
RUN mkdir /app/
WORKDIR /app/

# Copy the current directory contents into the container at /app
COPY . /app/

# Install Python dependencies
RUN pip install -r requirements.txt

# Define environment variables
ENV API_ID=29112026
ENV API_HASH=a660c8c6d50df59fe89099b341d8bf02
ENV BOT_TOKEN=7319183144:AAHvYtGpzdd46kTSCTRG4B_FaaRrjCbM12g
ENV BOT_USERNAME=COF_Ban_all_bot
ENV OWNER_ID=1973547213

# Expose port (optional, adjust as needed)
EXPOSE 80

# Run main.py when the container launches
CMD ["python3", "main.py"]
