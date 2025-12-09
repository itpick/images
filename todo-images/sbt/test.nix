{ pkgs, lib, ... }:

# TODO: Add tests for sbt image
{
  name = "sbt";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sbt"
    exit 1
  '';
}
