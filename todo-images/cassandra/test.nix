{ pkgs, lib, ... }:

# TODO: Add tests for cassandra image
{
  name = "cassandra";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cassandra"
    exit 1
  '';
}
