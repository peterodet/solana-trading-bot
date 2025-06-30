# Use an official Node.js runtime
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the source code
COPY . .

# Expose port if needed (Coolify will handle ports but for future reference)
EXPOSE 3000

# Start the bot using node built file instead of ts-node for better perf
CMD ["npx", "ts-node", "src/index.ts"]
