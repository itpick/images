{ pkgs, lib, ... }:

# TODO: Add tests for wordpress image
{
  name = "wordpress";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wordpress"
    exit 1
  '';
}
