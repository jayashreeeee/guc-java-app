# 🚀 GUC Java Deployment Automation Project

## 📌 Project Overview

This project demonstrates an end-to-end Java application deployment workflow using modern DevOps practices.

It consists of:

- GUC Frontend (Java Web Application - WAR)
- GUC Backend (Spring Boot REST API - JAR)

The project automates application deployment using Shell Scripting and Docker Compose.

---

# 🏗️ Architecture

```
                   Browser
                      │
          ┌───────────┴───────────┐
          │                       │
          ▼                       ▼

   Frontend Container      Backend Container

   Apache Tomcat           Spring Boot
   (WAR)                   (JAR)

          Docker Compose
```

---

# 📂 Project Structure

```
guc-java-app
│
├── deploy.sh
├── docker-compose.yml
├── README.md
│
├── guc-frontend
│   ├── Dockerfile
│   ├── pom.xml
│   └── src
│
└── guc-backend
    ├── Dockerfile
    ├── pom.xml
    ├── src
    └── artifacts
        └── guc-backend.jar
```

---

# 🛠 Technologies Used

- Java 17
- Spring Boot
- Apache Tomcat
- Maven
- Bash Shell Scripting
- Docker
- Docker Compose
- Git
- GitHub

---

# ⚙️ Features

✅ Java Web Application (WAR)

✅ Spring Boot REST API (JAR)

✅ Shell Script Deployment

✅ Dockerized Frontend

✅ Dockerized Backend

✅ Docker Compose Orchestration

✅ Automated Build & Deployment

---

# 🚀 Deployment Workflow

```
GitHub Repository
        │
        ▼
Shell Script
        │
        ▼
Build WAR
        │
        ▼
Deploy to Tomcat
        │
        ▼
Restart Tomcat
        │
        ▼
Download / Build Backend JAR
        │
        ▼
Run Backend
        │
        ▼
Application Running
```

---

# 🐳 Docker Workflow

```
Frontend

Dockerfile
      │
      ▼
Docker Image
      │
      ▼
Docker Container

----------------------------

Backend

Dockerfile
      │
      ▼
Docker Image
      │
      ▼
Docker Container

----------------------------

Docker Compose

docker compose up -d
```

---

# ▶️ Run using Shell Script

```bash
chmod +x deploy.sh

./deploy.sh
```

---

# ▶️ Run using Docker Compose

```bash
docker compose up -d
```

Stop services:

```bash
docker compose down
```

---

# 🌐 Application URLs

Frontend

```
http://localhost:8080
```

Backend

```
http://localhost:9090
```

---

# 📖 Learning Outcomes

During this project, I learned:

- Maven Build Lifecycle
- WAR & JAR Packaging
- Spring Boot
- Apache Tomcat Deployment
- Shell Scripting Automation
- Docker Image Creation
- Docker Networking
- Docker Compose
- Git & GitHub Workflow
- Troubleshooting Deployment Issues

---

# 👨‍💻 Author

**Umesh Chandra**

GitHub:
https://github.com/gucgit
