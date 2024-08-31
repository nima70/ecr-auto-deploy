# Use the ARM64-compatible Node.js image
# FROM --platform=linux/arm64 node:22-alpine
FROM  node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the port the application will run on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
