{ pkgs, lib, ... }:

# TODO: Add tests for timescaledb-compat image
{
  name = "timescaledb-compat";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for timescaledb-compat"
    exit 1
  '';
}
