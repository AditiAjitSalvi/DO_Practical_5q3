# Use Node.js 18 base image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Expose port 3000 (if your app listens on this)
EXPOSE 3000

# Command to run your app (assumes your main file is index.js and "start" is defined in package.json)
CMD ["npm", "start"]
