#Docker
It is a tool which makes Plug and Play like feature available for software
Imagine if you want to show you cool unhosted non-website project to someone, so you give them your repo access
but when they clone that repo you find out they do not have nodeJS or mongoDB installed to run that project, that is where Docker comes in

A docker is simply a layer between your Project and your system, so when you run your containerized Project, A docker script runs and install the necessary tools to run your project and utilize the computing and storage resources of host machine to run those tools before starting your actual project

##Images and Containers
#Images: They are a template of your project, every tool, library, code is in this
It is a Read Only template 
Images cannot be Updated
We always have to create a new Image
Images do not run directly

It can contains
1. NodeJS setup
2. React Setup
3. Code of application
4. Dependencies
5. Dockerfile

#Containers: They are a runnable instance of an Image
The container is a process that runs applications with images
Container is an isolated process
Container runs independently on a computer



##Docker hub and Docker Desktop

Docker Hub is an Online Tool that we can access over the Browser, hub.docker.com, here we can find Parent Images, such as Images of nodeJS (A node Image is very big to develop but fortunately some people have already created hen ce we can borrow that from here)

Docker Desktop is to be installed on our system, we can again search Parent Images in our desktop software, but with that we can also monitor running containers in our PC, Along with Dev Environment


## Base Image & Parent Image
If you have a project based on NodeJS, you need NodeJS as a Base Image
To build an Image we need a DockereFile as a reference

## Pulling or Downloading an Image
We can download an image from docker Hub or Docker Desktop
To Download a node Image from Docker Hub, open command line, you do not need to go to any specific folder because Docker is installed globally in your system
Go to Docker Hub and search NodeJS
docker pull node:22
Now we can see our image in Docker desktop and we can run by writing docker run -it node /bash/bin command

## Creating a Docker File
As of now we were pulling pre built images from Docker Hub 
Now we will create our own dockerfile from scratch
refer to ,/dockerfile

## Running our Docker Image in a container
#### How to run container with own project Image
```
Go to Docker Desktop
Go to Images, from the sidebar
We can see the list of images created
When we see the image we want to run, there will be a Play Button in the Row click it
A Dialog will appear, if we click the Run button NOW a PORT will not be assigned to our container
So click on the Dropdown arrow to open more options
Give the container a name
We can see a PORT number :5500/tcp, which is the PORT we used in our application, now the PORT we will write is the PORT on which our container will run on, It is in the best practice to keep the application PORT number and Container PORT number to be the same
Now we can click on Run
```
#### Random PORT and No PORT on Container
```
ONCE WE ASSIGN A PORT TO A CONTAINER, OUR APPLICATION NOW IS ONLY ACCESSIBLE ON THAT PORT
No PORT: If we do not assign a PORT to our Docker container, our application won't run, as it running in our container but not accessible outside  that container
Random PORT: lets say we do not know which PORT is assigned to which container, then we can have a conflict between ports when assigning a PORT to a new Container, So it is better to put in 0 which will assign a random PORT to our container, one you run the PORT you can know on which PORT your application is running by looking above the logs
```
#### Test Running app in container


## Docker Ignore File
```
We specify the files that we do not want in docker image, such as node_modules
```
#### Use of .dockerignore file
#### Create .dockerignore file
#### Add files and folder in .dockerignore file
refer to .dockerignore

## Delete Images and Containers
```
We cannot update Images, We always Create new Images, hence we need to delete previous images
Delete operation can be performed in two ways
1. Using Docker Desktop
2. Command Line OR Terminal; If images OR containers are on our server such as AWS, GCP, AZURE we can only use Terminal
```
#### Delete Images with Docker Desktop
```
Go to Images Menu from Sidebar
There will be a delete Icon in front of every image, click that anf click "Delete Forever"
Images that are being used in any Container, that is , whose status is "In Use" cannot be deleted
Hence we first need to delete the Container utilizing that specific Image
```
#### Delete Containers with Docker Desktop
```
Go to Containers Menu from Sidebar
There will be a delete Icon in front of every Container, click that anf click "Delete Forever"
```

#### Delete Images OR Containers with Terminal
```
To READ all images we use command: docker images
To DELETE an un-used image we use command: docker image rm <imageName>
To DELETE an in-used image forcefully we use command: docker image rm <imageName> -f
To READ all containers we use command("ps" stands for processors): docker ps -a
To DELETE a non running container we use command: docker container rm <containerName>
To DELETE a running container forcefully we use command: docker container rm <containerName> -f
```


## Manage Versions of Images
```
Whenever we create a new version of our project, we will need to create a new image of that project
Now either we can name our image a completely new name OR we can "create" a new version of it
To remove all the containers and images from a system we can use command: docker system prune--a 
To CREATE a new version of an image, we need to create the image version simultaneously: docker build -t basic__app:v2 .
Now if we go to Docker Desktop > Images, we will see the tag value is `v2` instead of `latest`

Now if we want a container to run around `v2` we use command: docker run --name basic-app-container-v2 -p 5000:5000 basic__app:v2
```

## Volumes in Docker