{ pkgs, lib, ... }:

# TODO: Add tests for adoptium-jre image
{
  name = "adoptium-jre";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for adoptium-jre"
    exit 1
  '';
}
