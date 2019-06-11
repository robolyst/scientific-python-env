# Scientific Python Environment

This is a Jupyter Lab python environment that runs inside a docker container.

## Get started

Run `docker-compose up` to start the Jupyter Lab server. If this is the first
time you are running the command, it may take a while to download and install
everything.

Once the server is up and running, point your web-browser to
`http://localhost:8888`.


## Adding extra python packages.

Add extra packages to the `requirements.txt` file and run
`docker-compose up --build` to rebulid the container.
