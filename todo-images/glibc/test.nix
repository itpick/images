{ pkgs, lib, ... }:

# TODO: Add tests for glibc image
{
  name = "glibc";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for glibc"
    exit 1
  '';
}
