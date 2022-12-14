# Python Builder
This project is used to help building images with already configured and compiled python.


## How to use?
 - run `build.sh` with the right environment variables
```bash
    export PYTHON_PRERELEASE_TAG=rc1
    export PYTHON_VERSION=3.11.0
    export BASE_IMAGE_OS=quay.io/centos/centos 
    export OS_RELEASE_TAG=stream9 
    bash build.sh  
```
- After that action, a new image will be built and pushed if you have the right permissions to do so. You will also see a new Dockerfile with the generated data on the working directory.


All environment variables are optional and can be set individually.
The default values for each environment variable is located on [build.sh file](build.sh)
e.g.

```bash
    export PYTHON_PRERELEASE_TAG=rc1
    export PYTHON_VERSION=3.11.0
    bash build.sh  
```
or 

```bash
    bash build.sh  
```

All images that are generated by me will be placed [here](https://quay.io/repository/eerez/python-builder)
