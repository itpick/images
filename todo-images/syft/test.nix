{ pkgs, lib, ... }:

# TODO: Add tests for syft image
{
  name = "syft";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for syft"
    exit 1
  '';
}
