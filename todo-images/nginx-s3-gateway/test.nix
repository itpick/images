{ pkgs, lib, ... }:

# TODO: Add tests for nginx-s3-gateway image
{
  name = "nginx-s3-gateway";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-s3-gateway"
    exit 1
  '';
}
