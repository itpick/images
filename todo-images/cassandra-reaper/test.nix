{ pkgs, lib, ... }:

# TODO: Add tests for cassandra-reaper image
{
  name = "cassandra-reaper";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cassandra-reaper"
    exit 1
  '';
}
