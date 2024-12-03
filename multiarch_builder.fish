function multiarch_builder --description 'Make sure there is a multiarch docker builder'
  if [ ( docker buildx ls | grep running | wc -l ) -ne 2 ]
    docker buildx rm multiarch
    docker buildx create \
    --bootstrap \
    --driver docker-container \
    --driver-opt network=host \
    --driver-opt image=moby/buildkit:latest \
    --use \
    --platform="linux/amd64,linux/arm64" \
    --name multiarch
end
echo "multiarch builder is ready"
end
