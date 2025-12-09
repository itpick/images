{ pkgs, lib, ... }:

# TODO: Add tests for pypiserver image
{
  name = "pypiserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pypiserver"
    exit 1
  '';
}
