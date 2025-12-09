{ pkgs, lib, ... }:

# TODO: Add tests for wavefront-collector-for-kubernetes image
{
  name = "wavefront-collector-for-kubernetes";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wavefront-collector-for-kubernetes"
    exit 1
  '';
}
