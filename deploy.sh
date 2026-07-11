#!/bin/bash

###############################################
# GUC Java Deployment Script
# Author : GUC
###############################################

set -e

echo "=============================================="
echo "      GUC Java Deployment Automation"
echo "=============================================="

# Project Paths
FRONTEND_DIR="$HOME/GUC/guc-java-app/guc-frontend/guc-frontend"
BACKEND_DIR="$HOME/GUC/guc-java-app/guc-backend/guc-backend"

# Tomcat Path (Homebrew)
TOMCAT_WEBAPPS="/opt/homebrew/opt/tomcat/libexec/webapps"

###############################################
echo ""
echo "[1/7] Building Frontend WAR..."

cd "$FRONTEND_DIR"

mvn clean package

###############################################
echo ""
echo "[2/7] Removing old Frontend deployment..."

rm -rf "$TOMCAT_WEBAPPS/guc-frontend"
rm -f "$TOMCAT_WEBAPPS/guc-frontend.war"

###############################################
echo ""
echo "[3/7] Deploying new WAR..."

cp target/guc-frontend.war "$TOMCAT_WEBAPPS"

###############################################
echo ""
echo "[4/7] Restarting Tomcat..."

brew services restart tomcat

sleep 5

###############################################
echo ""
echo "[5/7] Building Backend JAR..."

cd "$BACKEND_DIR"

./mvnw clean package

###############################################
echo ""
echo "[6/7] Checking existing Backend..."

PID=$(lsof -ti :9090 2>/dev/null || true)

if [ -n "$PID" ]; then
    echo "Stopping existing Backend (PID: $PID)"
    kill -9 "$PID"
    sleep 2
else
    echo "No existing Backend running."
fi

###############################################
echo ""
echo "[7/7] Starting Backend..."

nohup java -jar target/*.jar > backend.log 2>&1 &

sleep 8

###############################################
echo ""
echo "=============================================="
echo "      Deployment Completed Successfully"
echo "=============================================="

echo ""

echo "Frontend URL"
echo "----------------------------------------------"
echo "http://localhost:8080/guc-frontend"

echo ""

echo "Backend URL"
echo "----------------------------------------------"
echo "http://localhost:9090"

echo ""

echo "Backend Log"
echo "----------------------------------------------"
echo "$BACKEND_DIR/backend.log"

echo ""

echo "Running Processes"
echo "----------------------------------------------"

lsof -i :8080
echo ""
lsof -i :9090

echo ""
echo "Done."