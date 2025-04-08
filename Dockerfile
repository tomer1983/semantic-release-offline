# Use a more recent Node.js LTS version for better support and security
FROM node:20.8.1

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
# COPY package*.json ./

# Install dependencies using npm ci for reproducible builds
RUN npm ci

# Install semantic-release and required plugins globally
RUN npm install -g semantic-release @semantic-release/gitlab @semantic-release/changelog @semantic-release/exec @semantic-release/commit-analyzer @semantic-release/git @semantic-release/release-notes-generator

# Copy the rest of the application code
COPY . .

# Default command to run semantic-release
CMD ["semantic-release"]