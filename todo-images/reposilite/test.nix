{ pkgs, lib, ... }:

# TODO: Add tests for reposilite image
{
  name = "reposilite";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for reposilite"
    exit 1
  '';
}
