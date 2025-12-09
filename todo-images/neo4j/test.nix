{ pkgs, lib, ... }:

# TODO: Add tests for neo4j image
{
  name = "neo4j";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for neo4j"
    exit 1
  '';
}
