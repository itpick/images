{ pkgs, lib, ... }:

# TODO: Add tests for pgpool2_exporter image
{
  name = "pgpool2_exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgpool2_exporter"
    exit 1
  '';
}
