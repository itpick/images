{ pkgs, lib, ... }:

# TODO: Add tests for debezium-connect image
{
  name = "debezium-connect";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for debezium-connect"
    exit 1
  '';
}
