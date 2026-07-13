#!/bin/bash

VM_IP=$1
SSH_USER="azureuser"
SSH_KEY="/Users/jayashree/Downloads/devops-vm_key.pem"

if [ -z "$VM_IP" ]; then
    echo "Usage: $0 <VM_PUBLIC_IP>"
    exit 1
fi

echo "Checking SSH connectivity..."

ssh -i "$SSH_KEY" \
    -o StrictHostKeyChecking=no \
    -o ConnectTimeout=10 \
    $SSH_USER@$VM_IP "echo SUCCESS" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "SSH Check: SUCCESS"
else
    echo "SSH Check: FAILED"
    exit 1
fi


echo "Checking Java installation..."

ssh -i "$SSH_KEY" $SSH_USER@$VM_IP "java -version" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Java Check: SUCCESS"
else
    echo "Java Check: FAILED"
    exit 1
fi


echo "Checking Tomcat service..."

ssh -i "$SSH_KEY" $SSH_USER@$VM_IP "systemctl is-active tomcat" | grep -q active

if [ $? -eq 0 ]; then
    echo "Tomcat Check: SUCCESS"
else
    echo "Tomcat Check: FAILED"
    exit 1
fi


echo "Checking Application Endpoint..."
APP_URL="http://$VM_IP:8080/guc-backend/"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" $APP_URL)

if [ "$HTTP_STATUS" == "200" ]; then
    echo "Application Check: SUCCESS"
else
    echo "Application Check: FAILED (HTTP $HTTP_STATUS)"
    exit 1
fi


echo ""
echo "Health Check Result: SUCCESS"
