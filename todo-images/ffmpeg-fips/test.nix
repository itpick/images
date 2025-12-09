{ pkgs, lib, ... }:

# TODO: Add tests for ffmpeg-fips image
{
  name = "ffmpeg-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ffmpeg-fips"
    exit 1
  '';
}
