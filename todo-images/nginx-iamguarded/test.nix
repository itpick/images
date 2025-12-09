{ pkgs, lib, ... }:

# TODO: Add tests for nginx-iamguarded image
{
  name = "nginx-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-iamguarded"
    exit 1
  '';
}
