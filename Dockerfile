# Use an official Node.js runtime as a base image
FROM node:18

# Set the working directory inside the container (root directory since index.js is here)
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (to optimize caching)
COPY package*.json ./

# Install only production dependencies
RUN npm install

# Copy all project files to the working directory
COPY . .

# Expose port 8080 (Cloud Run default)
EXPOSE 8080

# Command to start the app
CMD ["node", "index.js"]
