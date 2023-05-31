# Go image - actually Debian 11
FROM golang:latest

# We'll work in the app directory
WORKDIR /app

# TO WORK WITH A REMOTE REPO
# Set up the SSH key
# COPY id_rsa /root/.ssh/id_rsa
# RUN chmod 600 /root/.ssh/id_rsa

# Get the github signature
# RUN touch /root/.ssh/known_hosts
# RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone the repo
# RUN git clone git@github.com:w3w-internal/techtest-devops-mfpx.git

# Copy cloned repo to the container
COPY techtest-devops-mfpx /app/techtest-devops-mfpx

# Change to the repo directory
WORKDIR /app/techtest-devops-mfpx

# Compile the application
RUN go build -o /app

# Delete source
RUN rm -rf /app/techtest-devops-mfpx

# Expose the leet port
EXPOSE 1337

# Run the app
CMD ["/app/techtest-devops"]
