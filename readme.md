# Bitnuke Compose
This project is designed to be a composable stack for bitnuke.  
The project lifts sperate bitnuke, nginx, and redis services that  
talk to eachother within the stack and expose one port for nginx  
to the world.

## Quick Start
- To lift the stack without building anything locally execute: `make compose` or
`docker-compose up`.  This will pull the latest images from dockerhub and lift
the stack.
- To build the stack before lifting execute: `make build` and then `make
  compose` consecutively. This will build the images locally and pull the latest
  from [binder](https://cryo.unixvoid.com).
