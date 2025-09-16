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


# docker compose stop backend && docker compose run --rm backend node packages/backend migrate --config app-config.yaml --config app-config.docker.yaml
# docker compose exec postgres psql -U backstage -d backstage -c "\dt"

echo "Backstage is running at:"
echo "Frontend: http://localhost:3000"
echo "Backend: http://localhost:7007"


docker compose run --rm backend node packages/backend migrate --config app-config.yaml --config app-config.docker.yaml