function trilium --description 'Trilium web'
docker run \
    --name trilium-web \
    -d \
    -p 127.0.0.1:8080:8080 \
    --restart always \
    -v ~/trilium-data:/home/node/trilium-data \
    triliumnext/notes
end
