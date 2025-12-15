# opencv

OpenCV is a C++ computer vision and machine learning software library for image/video processing, object detection, face recognition, and more

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opencv

# Load into Docker
nix build .#load-opencv-to-docker && ./result/bin/load-opencv-to-docker
```
