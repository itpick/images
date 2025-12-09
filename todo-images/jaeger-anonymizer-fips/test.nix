{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-anonymizer-fips image
{
  name = "jaeger-anonymizer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-anonymizer-fips"
    exit 1
  '';
}
