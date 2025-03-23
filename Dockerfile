# Base image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy files
COPY app.js .

# Install dependencies
RUN npm install ip

# Expose Docker port
EXPOSE 3000

# Set default environment variable
ENV PORT=3000

# Start app
CMD ["node", "app.js"]
