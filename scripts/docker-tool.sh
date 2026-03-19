list() {
  docker image ls -a
  docker container ls -a
}

removeImages() {
	docker image list --format table | awk '{print $3}' | xargs docker image remove
}

removeContainers() {
	docker container list -a --format table | awk '{print $1}' | xargs docker container stop 
	docker container list -a --format table | awk '{print $1}' | xargs docker container remove
}

case "$1" in
	ri)
		removeImages
		;;
	rc)
		removeContainers 
		;;
esac
