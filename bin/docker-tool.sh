

list() {
  docker image ls -a
  docker container ls -a
}

removeImages() {
  docker image ls -a | tail -n +2 | xargs docker image remove -f
}

removeContainers() {
  docker container ls -a | tail -n +2 | xargs docker container remove -f
}