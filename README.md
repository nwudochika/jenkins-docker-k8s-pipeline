# Jenkins Docker Kubernetes Pipeline

[![CI/CD](https://img.shields.io/badge/CI%2FCD-Jenkins-blue?logo=jenkins)](https://jenkins.io)
[![Docker](https://img.shields.io/badge/Container-Docker-2496ED?logo=docker)](https://docker.com)
[![Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?logo=kubernetes)](https://kubernetes.io)
[![AWS EKS](https://img.shields.io/badge/Cloud-AWS%20EKS-FF9900?logo=amazon-aws)](https://aws.amazon.com/eks)

A complete **CI/CD pipeline** for containerized Apache web applications using **Jenkins**, **Docker**, **Docker Hub**, and **Kubernetes (EKS)**. This project automates the entire workflow — from code commit to production deployment — following cloud-native DevOps best practices.

---

## Architecture Overview

![Pipeline Architecture](./images/Projectflow.png)

**Flow:** `GitHub` → `Jenkins` → `Docker Build & Test` → `Manual Approval` → `Docker Hub` → `Kubernetes (EKS)`

---

## Features

- **Automated Build** — Jenkins builds Docker images on every trigger
- **Container Testing** — Runs containers locally before pushing to registry
- **Manual Approval Gate** — Human validation before production deployment
- **Registry Integration** — Pushes images to Docker Hub with versioned tags
- **Kubernetes Deployment** — Deploys to AWS EKS with LoadBalancer service
- **Apache Web Server** — Serves a custom welcome page on port 80

---

## Tech Stack

| Component | Technology |
|-----------|------------|
| **CI/CD** | Jenkins |
| **Container Runtime** | Docker |
| **Container Registry** | Docker Hub |
| **Orchestration** | Kubernetes (AWS EKS) |
| **Base Image** | Fedora + Apache (httpd) |
| **Source Control** | GitHub |

---

## Prerequisites

- Jenkins server with Docker and kubectl installed
- Docker Hub account
- GitHub repository
- AWS account with EKS cluster configured
- Jenkins credentials for:
  - `GitHub-creds` — GitHub authentication
  - `DockerHub-creds` — Docker Hub username and password

---

## Project Structure

```
jenkins-docker-k8s-pipeline/
├── jenkinsfile                    # Jenkins pipeline definition
├── Dockerfile                     # Apache container definition
├── index.html                     # Web application content
├── Deployment-manifest-file.yml   # Kubernetes Deployment
├── LoadBalancerservice-ManifestFile.yml  # Kubernetes LoadBalancer Service
├── images/
│   └── Projectflow.png            # Pipeline architecture diagram
└── README.md
```

---

## Pipeline Stages

| Stage | Description |
|-------|-------------|
| **Source** | Clone code from GitHub repository |
| **Build** | Build Docker image with tag `v${BUILD_NUMBER}` |
| **Test** | Run container locally on port 80 for validation |
| **Manual Approval** | Wait for human approval before deployment |
| **Deploy to DockerHub** | Push image to Docker Hub |
| **Deploy to EKS** | Apply Kubernetes manifests to EKS cluster |

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/nwudochika/jenkins-docker-k8s-pipeline.git
cd jenkins-docker-k8s-pipeline
```

### 2. Configure Jenkins

1. Create a **Pipeline** job in Jenkins
2. Add credentials:
   - **GitHub-creds** — Username/password or token for GitHub
   - **DockerHub-creds** — Docker Hub username and password
3. Set pipeline definition to **Pipeline script from SCM**
4. Point to this repository and specify `jenkinsfile` as the script path

### 3. Configure Kubernetes Access

Ensure the Jenkins server can access your EKS cluster:

```bash
aws eks update-kubeconfig --name <your-cluster-name> --region <region>
```

---

## Usage

1. Push changes to the `main` branch
2. Jenkins will automatically trigger the pipeline (or trigger manually)
3. After manual approval, the application deploys to EKS
4. Access the application via the LoadBalancer external URL:

```bash
kubectl get svc apache-loadbalancer-service
```

---

## Application Preview

The deployed application serves a simple welcome page:

![Deployed Application](./images/deployed-app.png)

*Add a screenshot of your running application to `images/deployed-app.png` for better documentation.*

---

## Author

**Chikaeze Fidelis Junior Nwudo**

---

## License

This project is open source and available for learning and reference.
