{ pkgs, lib, ... }:

# TODO: Add tests for nextflow-fips image
{
  name = "nextflow-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nextflow-fips"
    exit 1
  '';
}
