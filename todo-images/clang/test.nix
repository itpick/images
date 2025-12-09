{ pkgs, lib, ... }:

# TODO: Add tests for clang image
{
  name = "clang";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clang"
    exit 1
  '';
}
