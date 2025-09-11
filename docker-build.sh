#!/bin/bash

echo "Building Backstage Docker containers..."

# Install dependencies and build
echo "Installing dependencies..."
yarn install --immutable

echo "Building TypeScript..."
yarn tsc

echo "Building backend..."
yarn build:backend

echo "Building frontend..."
yarn workspace app build

# Build and start containers
echo "Building and starting containers..."
docker compose up --build

echo "Backstage is running at:"
echo "Frontend: http://localhost:3000"
echo "Backend: http://localhost:7007"