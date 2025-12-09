{ pkgs, lib, ... }:

# TODO: Add tests for pypy image
{
  name = "pypy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pypy"
    exit 1
  '';
}
