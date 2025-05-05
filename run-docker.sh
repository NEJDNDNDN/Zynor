#!/bin/bash

# سكربت معدل بواسطة: 𝑫𝑨𝑹𝑲 𝑯𝑨𝑪𝑲𝑬𝑹 - https://t.me/+PFbp1Ayc_1I3ZTFk
# I'm not that familiar with docker. Send a PR if something is wrong (^.^)

BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")
if [[ ! -d "$BASE_DIR/auth" ]]; then
    echo "Creating Auth Directory.."
	mkdir -p "$BASE_DIR/auth"
fi

CONTAINER="zphisher"
IMAGE="htrtech/zphisher:latest"
IMG_MIRROR="ghcr.io/htr-tech/zphisher:latest"
MOUNT_LOCATION=${BASE_DIR}/auth
check_container=$(docker ps --all --format "{{.Names}}")

if [[ ! $check_container == $CONTAINER ]]; then
	echo "Creating new container..."
	docker create \
		--interactive --tty \
		--volume ${MOUNT_LOCATION}:/zphisher/auth/ \
		--network host \
		--name "${CONTAINER}" \
		"${IMAGE}"
fi

docker start --interactive "${CONTAINER}"