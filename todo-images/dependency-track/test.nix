{ pkgs, lib, ... }:

# TODO: Add tests for dependency-track image
{
  name = "dependency-track";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dependency-track"
    exit 1
  '';
}
