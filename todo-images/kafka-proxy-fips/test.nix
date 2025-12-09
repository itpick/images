{ pkgs, lib, ... }:

# TODO: Add tests for kafka-proxy-fips image
{
  name = "kafka-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafka-proxy-fips"
    exit 1
  '';
}
