{ pkgs, lib, ... }:

# TODO: Add tests for kots image
{
  name = "kots";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kots"
    exit 1
  '';
}
