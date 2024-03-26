# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install 

# Expose the port the app runs on
EXPOSE 3000

# Copy the rest of the application code
COPY . .

# Build
RUN npm run build --only=production

# Run nest.js
CMD ["npm", "run", "start:prod"] 