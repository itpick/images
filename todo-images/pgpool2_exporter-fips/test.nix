{ pkgs, lib, ... }:

# TODO: Add tests for pgpool2_exporter-fips image
{
  name = "pgpool2_exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgpool2_exporter-fips"
    exit 1
  '';
}
