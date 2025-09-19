#!/bin/bash
set -e  # stop on error

# First argument = environment (qa | prod | default: dev)
ENV=$1

echo "======================================="
echo "🚀 Starting Node Backend Deployment"
echo "Environment: ${ENV:-dev}"
echo "======================================="

# Move into backend folder
cd "$(dirname "$0")/node-backend"

# Install production dependencies
echo "📦 Installing dependencies..."
npm ci --only=production

# Set NODE_ENV based on argument
if [ "$ENV" = "qa" ]; then
  export NODE_ENV=qa
elif [ "$ENV" = "prod" ]; then
  export NODE_ENV=production
else
  export NODE_ENV=development
fi

# Run the backend server
echo "▶️ Running server.js with NODE_ENV=$NODE_ENV"
node server.js