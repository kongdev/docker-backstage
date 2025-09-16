#!/bin/bash
# docker-down.sh
# ใช้สำหรับหยุดและลบ docker-compose stack พร้อม images และ volumes

set -e

echo "🚧 Stopping and removing docker-compose stack..."
docker compose down --rmi all --volumes --remove-orphans

echo "✅ Docker Compose stack has been fully cleaned up."
