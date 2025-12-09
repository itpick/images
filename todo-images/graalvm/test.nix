{ pkgs, lib, ... }:

# TODO: Add tests for graalvm image
{
  name = "graalvm";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for graalvm"
    exit 1
  '';
}
