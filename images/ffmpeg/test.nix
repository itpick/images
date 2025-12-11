{ pkgs, lib, ... }:

# TODO: Add tests for ffmpeg image
{
  name = "ffmpeg";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ffmpeg"
    exit 1
  '';
}
