# Mojo image

It's just a basic prebuild docker image for mojo

## Use the prebuild image

1. Clone the git repository
2. `make load`

## Build yourself the image

- `make build` 


## Export

To export you image, please run the following command:
```
docker export $(docker ps -qf "ancestor=base_mojo_image") -o base_mojo_image.tar && gzip base_mojo_image.tar
```
