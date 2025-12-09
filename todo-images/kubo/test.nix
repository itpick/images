{ pkgs, lib, ... }:

# TODO: Add tests for kubo image
{
  name = "kubo";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubo"
    exit 1
  '';
}
