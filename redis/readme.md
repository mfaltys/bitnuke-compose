# unixvoid/redis
This project is intended to be a small redis image for production use.
For now this image adds in a filesystem that was built statically.  In
near future I plan to create a build project that will build this statically,
but for now it remains as a binary.

- to build this image do something similar to the following
  - `sudo docker build -t redis .`
