{ pkgs, lib, ... }:

# TODO: Add tests for arangodb image
{
  name = "arangodb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for arangodb"
    exit 1
  '';
}
