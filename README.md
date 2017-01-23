[![](https://images.microbadger.com/badges/image/robertdebock/docker-revealmd.svg)](https://microbadger.com/images/robertdebock/docker-revealmd "Get your own image badge on microbadger.com")

# The reveal-md container.
The application reveal-md is used to show markdown files in the browser.

# Building the container.
This is required once.

    docker build .

This will output an identifier of the build image. Use it to run the container.

# Running the container.

    docker run -p 1948:1948 THE_ID_FROM_THE_PREVIOUS_COMMAND

# An alternative way.
If you're lazy, use:

    docker run -p 1948:1948 $(docker build -q .)

Which builds an image and runs it immediately.

# Seeing the presentation.
Open your browser and go to: http://localhost:1948/ (Or incase Docker is running somewhere else, replace "localhost" by the name of host Docker is running on.)
