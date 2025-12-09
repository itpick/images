{ pkgs, lib, ... }:

# TODO: Add tests for wave image
{
  name = "wave";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wave"
    exit 1
  '';
}
