# Build Containers

## Description
Personal collection of build containers for setting up cross-compile toolchains.

## Requirements:
- podman
- [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
  - optional, if running nvidia and would like to render to host from the container
  - recommended to install using your distro's package manager if available or AUR


## GPU-accelerated containers with host-rendering
Some of these are meant for running GPU-accelerated apps that render on the host.

To test your setup, build glxgears-test:

### Note:
You may have to execute `xhost +local:` in case you run into permission errors

### Build:
```bash
podman build \
  -t glxgears-test \
  -f src/glxgears-test.dockerfile
```

### Test OpenGL:
```bash
podman run -it --rm \
  --device nvidia.com/gpu=0 \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  glxgears-test:latest "glxgears"
```

### Test Vulkan:
```bash
podman run -it --rm \
  --device nvidia.com/gpu=0 \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  glxgears-test:latest "vkcube"
```

### Note regarding selinux
In addition to these steps, you may need to disable selinux label
so that the runtime socket can be properly mounted:

```bash
podman run -it --rm \
  --security-opt label=disable \
  --device nvidia.com/gpu=0 \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  glxgears-test:latest "glxgears"
```

### On AMD/Intel
Specify `--device` like:

```bash
podman run -it --rm \
  --security-opt label=disable \
  --device /dev/dri \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  glxgears-test:latest "vkcube"
```
*note that vulkan may fallback to lavapipe if the image does not support latest vulkan drivers

## Web dev containers

example:

```bash
podman run -itd \
--entrypoint /bin/bash \
-p 3000:3000 \
--name astro_dev \
-v /path/to/project:/src:z \
-w /src \
webdev:latest
```
where port 3000 on the host is mapped to the container port
