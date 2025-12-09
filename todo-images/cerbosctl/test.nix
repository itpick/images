{ pkgs, lib, ... }:

# TODO: Add tests for cerbosctl image
{
  name = "cerbosctl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cerbosctl"
    exit 1
  '';
}
