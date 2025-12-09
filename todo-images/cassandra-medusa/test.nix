{ pkgs, lib, ... }:

# TODO: Add tests for cassandra-medusa image
{
  name = "cassandra-medusa";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cassandra-medusa"
    exit 1
  '';
}
