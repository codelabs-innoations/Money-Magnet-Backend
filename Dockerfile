# Use an official Node.js runtime as a base image
FROM node:16

# Set the working directory inside the container (root directory since index.js is here)
WORKDIR /app

# Copy package.json and package-lock.json first (to optimize caching)
COPY package*.json ./

# Install only production dependencies
RUN npm install

# Copy all project files to the working directory
COPY . .

# Command to start the app
CMD ["node", "index.js"]
