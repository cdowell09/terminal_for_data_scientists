# Special Topic: Docker, Docker Compose, and Makefiles

## Introduction to Docker

Docker is a platform for developing, shipping, and running applications in containers. Containers are lightweight, standalone, executable packages that include everything needed to run a piece of software, including the code, runtime, system tools, libraries, and settings.

## Understanding Docker Terminology: The Shipping Container Analogy

To understand Docker, let's use the analogy of international shipping containers. This analogy works well because Docker actually got its name and logo from the shipping industry!

### Key Terms and Their Analogies

1. **Docker Image** 
   - *Analogy*: A shipping container blueprint
   - *Explanation*: Just as a shipping container blueprint specifies how to build a standard container, a Docker image is a blueprint for creating Docker containers. It contains all the necessary instructions and components to create a running container.

2. **Dockerfile**
   - *Analogy*: The construction plan for a custom shipping container
   - *Explanation*: If you need a specialized container, you'd create a custom construction plan. Similarly, a Dockerfile is a script of instructions that tells Docker how to build a custom image.

3. **Docker Container**
   - *Analogy*: An actual shipping container filled with goods
   - *Explanation*: Just as a real shipping container is an instance of the blueprint filled with specific cargo, a Docker container is a running instance of a Docker image, containing your application and its environment.

4. **Docker Hub**
   - *Analogy*: A global shipping container depot
   - *Explanation*: Like a central depot where you can find standard shipping containers, Docker Hub is a cloud-based registry where you can find and download pre-made Docker images.

5. **Docker Compose**
   - *Analogy*: A shipping manifest for a fleet of specialized containers
   - *Explanation*: When you need to ship a complex product requiring multiple specialized containers, you'd create a manifest detailing all containers and their relationships. Docker Compose does this for multi-container Docker applications.

6. **Docker Volume**
   - *Analogy*: A separate, reusable cargo unit that can be loaded into different containers
   - *Explanation*: Just as you might have cargo that needs to be transferred between different containers, Docker volumes are a way to persist and share data between containers.

7. **Docker Network**
   - *Analogy*: The shipping lanes and communication systems between containers
   - *Explanation*: Like how shipping containers need defined routes and communication systems to work together, Docker networks allow containers to communicate with each other and the outside world.

### The Process in Action

1. You write a **Dockerfile** (construction plan) to create a custom shipping container for your specific needs.

2. Docker uses this Dockerfile to **build** an **image** (container blueprint).

3. From this image, you can **run** as many **containers** (actual filled shipping containers) as you need.

4. If your application needs multiple containers working together (like a ship needs multiple containers), you use **Docker Compose** to define and manage this multi-container setup.

5. These containers can store and share data using **volumes**, and communicate through **networks**.

6. You can store your images in **Docker Hub**, allowing others to download and use your container blueprints.

This shipping container analogy helps visualize how Docker components work together to package, distribute, and run applications in isolated environments. Just as shipping containers revolutionized global trade by providing a standardized way to ship goods, Docker has revolutionized software development and deployment by providing a standardized way to package and run applications.

### Basic Docker Commands

- Build an image: `docker build -t my-image .`
- Run a container: `docker run my-image`
- List running containers: `docker ps`
- Stop a container: `docker stop container_id`
- Remove a container: `docker rm container_id`
- List images: `docker images`
- Remove an image: `docker rmi image_id`

### Example Dockerfile for a Python Application

```dockerfile
# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code into the container
COPY . .

# Specify the command to run when the container starts
CMD ["python", "app.py"]
```

## Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It uses YAML files to configure application services and performs the creation and start-up of all the containers with a single command.

### Key Concepts

1. **docker-compose.yml**: A YAML file that defines services, networks, and volumes for a Docker application.
2. **Service**: A container in production.
3. **Volume**: A persistent storage area used by containers.

### Basic Docker Compose Commands

- Start services: `docker-compose up`
- Start services in detached mode: `docker-compose up -d`
- Stop services: `docker-compose down`
- View logs: `docker-compose logs`
- Execute command in a service: `docker-compose exec service_name command`

### Example docker-compose.yml

```yaml
version: '3'  # Specify the version of Docker Compose file format

services:
  jupyter:  # Define a service for Jupyter Notebook
    build: .  # Build an image from the Dockerfile in the current directory
    ports:
      - "8888:8888"  # Map container's port 8888 to host's port 8888
    volumes:
      - .:/app  # Mount the current directory to /app in the container
    command: jupyter notebook --ip 0.0.0.0 --allow-root  # Command to run Jupyter Notebook

  train:  # Define a service for training the model
    build: .  # Build an image from the Dockerfile in the current directory
    volumes:
      - .:/app  # Mount the current directory to /app in the container
    command: python train_model.py  # Command to run the training script
```

## Makefiles with Docker

Makefiles can be used alongside Docker to simplify common tasks and create a consistent interface for your project.

### Example Makefile

```makefile
.PHONY: jupyter train clean  # Declare these targets as phony

jupyter:
    docker-compose up jupyter  # Start the Jupyter Notebook service

train:
    docker-compose up train  # Start the model training service

clean:
    docker-compose down  # Stop and remove containers, networks, images, and volumes
    docker system prune -f  # Remove all unused Docker resources
```

With this Makefile, you can use commands like `make train`.

## Advanced Docker Concepts

### 1. Multi-stage Builds

Multi-stage builds allow you to use multiple FROM statements in your Dockerfile. This is useful for creating smaller production images.

```dockerfile
# Build stage
FROM python:3.9 AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

# Production stage
FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH
CMD ["python", "app.py"]
```

### 2. Docker Networks

Docker networks allow containers to communicate with each other and the outside world.

Create a network: `docker network create my-network`
Run a container in a network: `docker run --network my-network my-image`

### 3. Docker Volumes

Volumes are the preferred way to persist data generated and used by Docker containers.

Create a volume: `docker volume create my-volume`
Use a volume: `docker run -v my-volume:/app/data my-image`

## Best Practices

1. Use official base images when possible.
2. Minimize the number of layers in your Dockerfile.
3. Use `.dockerignore` to exclude unnecessary files.
4. Don't run containers as root unless necessary.
5. Use environment variables for configuration.
6. Tag your images with meaningful, versioned tags.
7. Use docker-compose for multi-container applications.
8. Regularly update your base images and dependencies.

## Docker in Data Science Workflows

Docker is particularly useful in data science for creating reproducible environments:

1. **Jupyter Notebooks**: Create a containerized Jupyter environment with all necessary libraries.

2. **ML Model Deployment**: Package your trained model and serving code in a container for easy deployment.

3. **Data Pipelines**: Use Docker Compose to set up complex data processing pipelines with multiple services.

4. **GPU Support**: Utilize NVIDIA Docker for GPU-accelerated computing in containers.

## Exercise: Dockerizing a Data Science Project

1. Create a Dockerfile for a Python data science project:

```dockerfile
FROM python:3.9

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "train_model.py"]
```

2. Create a docker-compose.yml file:

```yaml
version: '3'
services:
  jupyter:
    build: .
    ports:
      - "8888:8888"
    volumes:
      - .:/app
    command: jupyter notebook --ip 0.0.0.0 --allow-root
  train:
    build: .
    volumes:
      - .:/app
    command: python train_model.py
```

3. Create a Makefile:

```makefile
.PHONY: jupyter train clean

jupyter:
    docker-compose up jupyter

train:
    docker-compose up train

clean:
    docker-compose down
    docker system prune -f
```

This setup allows you to easily start a Jupyter notebook environment or run your model training script in isolated containers.

Remember, while Docker provides many benefits, it also adds complexity to your workflow. It's important to weigh the advantages against the overhead for each project.
