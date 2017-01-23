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
