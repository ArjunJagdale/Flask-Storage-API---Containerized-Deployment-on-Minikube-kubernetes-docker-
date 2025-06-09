# Cloud-Native-Storage-API-with-Docker-and-Kubernetes

This project demonstrates the design and development of a back-end storage system component as a Proof of Concept (PoC) aligned with modern cloud-native storage architectures. It showcases containerization of a Python Flask-based Storage API using Docker and deployment on a local Kubernetes cluster powered by Minikube. The project reflects hands-on experience with storage concepts, container orchestration, cloud platforms, and automation tools relevant to emerging storage system designs.

---

## Project Summary and Objectives

- Assist in building a backend storage API that handles file uploads and temporary storage.
- Contribute to a PoC that simulates cloud-native storage by containerizing the service and orchestrating it on Kubernetes.
- Write clean, efficient, and well-documented Python code packaged in a Docker container.
- Deploy and manage the application using Kubernetes manifests (Deployment & Service) on Minikube.
- Automate build and deployment processes with PowerShell scripts suited for Windows environments.
- Gain practical exposure to containerization (Docker), orchestration (Kubernetes), and cloud-native deployment patterns.
- Document the deployment setup and technical findings in a clear and structured manner.

---

## Technologies & Concepts Covered

- **Programming Languages**: Python (Flask) for backend API development.
- **Storage Concepts**: File storage with an upload directory to mimic object/block storage patterns.
- **Containerization**:  
  - Docker to package the Flask application and dependencies into a portable container image.
  - Dockerfile used to specify base image, dependencies, and app setup.
- **Container Orchestration**:  
  - Kubernetes for deploying and managing the Flask API pods.
  - Minikube to run a local Kubernetes cluster on Windows.
  - Kubernetes Deployment to manage replica sets and container lifecycle.
  - Kubernetes Service with NodePort to expose the app locally.
- **Cloud Platforms**: Exposure to local cloud-native environment via Minikube (simulates cloud cluster).
- **Automation & Scripting**:  
  - PowerShell scripts for building Docker images and applying Kubernetes manifests.
  - Scripts automate deployment (`deploy.ps1`) and cleanup (`cleanup.ps1`).
- **Version Control**: Git recommended for source code and infrastructure-as-code tracking.
- **Development Practices**: Clean, modular code with clear folder structure and documentation.

---

## Application Details

The core of the project is a Python Flask application that provides simple storage backend functionality:

- **`app.py`**:  
  Implements REST API endpoints to receive file uploads and save them into a dedicated `uploads/` directory.
- **Uploads Directory**:  
  Created during container runtime at `/app/uploads` to temporarily hold uploaded files, mimicking file/object storage behavior.
- **Requirements**:  
  Python dependencies are specified in `requirements.txt` and installed in the Docker image.

This simple storage API represents backend components of a storage system, as required for storage engineering roles focusing on backend and cloud-native solutions.

---

## Project Structure

```

.
├── app/
│   ├── app.py              # Flask backend code handling file uploads
│   └── uploads/            # Upload directory inside container (created at runtime)
├── k8s/
│   ├── deployment.yaml     # Kubernetes Deployment manifest
│   └── service.yaml        # Kubernetes Service manifest exposing app via NodePort
├── scripts/
│   ├── deploy.ps1          # PowerShell deployment script (Windows)
│   ├── cleanup.ps1         # PowerShell cleanup script (Windows)
│   ├── deploy.sh           # Bash deployment script (Linux/macOS)
│   └── cleanup.sh          # Bash cleanup script (Linux/macOS)
├── Dockerfile              # Defines container image for Flask app
├── requirements.txt        # Python dependencies list
└── README.md               # This documentation

````

---

## Setup and Usage (Windows)

### Prerequisites

- Docker Desktop (with WSL2 backend recommended)
- Minikube installed and running
- `kubectl` CLI configured for Minikube
- PowerShell with script execution enabled (`Set-ExecutionPolicy`)
- Git (optional but recommended)

### Steps

1. **Start Minikube**

```powershell
   minikube start
````

2. **Configure Docker CLI to Use Minikube’s Docker Daemon**

   This enables building images directly inside Minikube's environment:

   ```powershell
   & minikube -p minikube docker-env --shell=powershell | Invoke-Expression
   docker build -t flask-storage-app .
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   minikube service flask-storage-service
   ```

3. **Deploy the Application**

   Run the deployment script to build the Docker image and deploy the app to Kubernetes:

   ```powershell
   .\scripts\deploy.ps1
   ```

   This script will:

   * Build the Docker image `flask-storage-app`.
   * Apply Kubernetes manifests to create Deployment and Service resources.

4. **Access the Storage API**

   Get the URL to access the service:

   ```powershell
   minikube service flask-storage-service --url
   ```

   Open the printed URL in your browser. You should see:

   ```
   Storage API is running.
   ```

5. **Cleanup Resources**

   To delete deployed Kubernetes resources:

   ```powershell
   .\scripts\cleanup.ps1
   ```

---

## Project Screenshots:

![1](https://github.com/user-attachments/assets/ca85cc28-3d7d-4124-a20a-7f6d1c99ffab)
![2](https://github.com/user-attachments/assets/573b6d9c-92f0-417e-8e74-00d2488c6c57)
![3](https://github.com/user-attachments/assets/38dc9a84-7181-40a9-ab32-23b241b44df1)

## Summary

* **Backend Development**: Developed a backend component for file storage using Python Flask.
* **Proof of Concept (PoC)**: Created a PoC illustrating cloud-native storage by containerizing the app and orchestrating it in Kubernetes.
* **Clean, Efficient Code**: Python code written following best practices, containerized with clear Dockerfile and documentation.
* **Containerization & Orchestration**: Hands-on with Docker and Kubernetes, including local cluster setup (Minikube).
* **Cloud Exposure**: Leveraged Minikube as a local cloud-native environment mimicking cloud platform Kubernetes clusters.
* **Scripting & Automation**: Automated build and deployment using PowerShell scripts adapted for Windows.
* **Storage Concepts**: Familiarity with file/object storage by implementing upload directory and RESTful file handling.
* **Version Control Awareness**: Encouraged use of Git for managing code and infrastructure manifests.
* **Learning & Innovation**: Explored container orchestration and cloud-native patterns in a fast-paced learning environment.

---

## Future Improvements & Extensions

* Add persistent storage volumes to retain uploads beyond pod restarts.
* Implement authentication and authorization for secure storage access.
* Extend API to support metadata management and object lifecycle policies.
* Integrate monitoring/logging tools for observability.
* Move from local Minikube to managed cloud Kubernetes services (IBM Cloud, AWS EKS, GKE).
* Introduce CI/CD pipelines for automated testing and deployment.

---

## References

* [Docker Official Documentation](https://docs.docker.com/)
* [Kubernetes Basics Tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
* [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
* [Flask Documentation](https://flask.palletsprojects.com/)
* [PowerShell Execution Policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy)

---
