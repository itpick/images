{ pkgs, lib, ... }:

# TODO: Add tests for pgbouncer-iamguarded image
{
  name = "pgbouncer-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgbouncer-iamguarded"
    exit 1
  '';
}
