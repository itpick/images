{ pkgs, lib, ... }:

# TODO: Add tests for pgbouncer image
{
  name = "pgbouncer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgbouncer"
    exit 1
  '';
}
