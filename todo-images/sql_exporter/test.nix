{ pkgs, lib, ... }:

# TODO: Add tests for sql_exporter image
{
  name = "sql_exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sql_exporter"
    exit 1
  '';
}
