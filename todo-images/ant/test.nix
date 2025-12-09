{ pkgs, lib, ... }:

# TODO: Add tests for ant image
{
  name = "ant";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ant"
    exit 1
  '';
}
