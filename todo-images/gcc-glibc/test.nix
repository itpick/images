{ pkgs, lib, ... }:

# TODO: Add tests for gcc-glibc image
{
  name = "gcc-glibc";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gcc-glibc"
    exit 1
  '';
}
