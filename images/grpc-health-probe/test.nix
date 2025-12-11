{ pkgs, lib, ... }:

# TODO: Add tests for grpc-health-probe image
{
  name = "grpc-health-probe";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grpc-health-probe"
    exit 1
  '';
}
