{ pkgs, lib, ... }:

# TODO: Add tests for kafka-bridge-fips image
{
  name = "kafka-bridge-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafka-bridge-fips"
    exit 1
  '';
}
