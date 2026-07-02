# Use the official lightweight Node.js image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files first to leverage Docker caching layers
COPY package*.json ./

# Install application dependencies
RUN npm ci --only=production

# Copy the rest of the application source code
COPY . .

# Expose the internal port the app listens on
EXPOSE 3000

# Define the command to execute your application
CMD ["npm", "start"]
