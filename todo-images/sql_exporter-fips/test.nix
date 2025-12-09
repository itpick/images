{ pkgs, lib, ... }:

# TODO: Add tests for sql_exporter-fips image
{
  name = "sql_exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sql_exporter-fips"
    exit 1
  '';
}
