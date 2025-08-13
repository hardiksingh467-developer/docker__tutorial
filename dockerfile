# This is a comment in a Dockerfile
# we will write the same commands we used in creating the application

# The first thing we did when creating our backend was installing NodeJS
# Hence we will use command, FROM baseImage
FROM node:latest 
# Or we can say use the FROM node:22

# If we want the code to be copied and executed in a specific directory, we can write command
# WORKDIR /folder__name

# Now we need to copy our code to the image
# Hence we will use command, COPY source dest
COPY . .
# we wrote . and . because we want to copy everything from the current directory to the image and our dockerfile is one the same level of package.json

# Now obviously we ignore node_modules and .git
# We can do this by creating a file called .dockerignore, and for the absence of node_modules, we will inform our dockerfile to run npm install
RUN npm install

# Now by default we pass the PORT number on which our application runs
# Now if we run our application from command line it is not necessary to pass the PORT number
# But if we run it from docker, we need to pass the PORT number
# Hence we will use command, EXPOSE portNumber, the portNumber will be same as we specify in our express application when we create our express server our application
EXPOSE 5500

# Now we will specify the command to  run our application
# Hence we will use command, CMD [command]
# As our command to run our application is node index.js, that is, it contains space, we will use the array format
# If it was a single word command, we could have used CMD command
CMD ["node", "index.js"]


# Now finally all we have to do is run the docker build command
# docker build -t imageName .
# OR
# docker build -t imageName ../drobo__driven
# This will create our image that we can see in terminal or in Docker desktop