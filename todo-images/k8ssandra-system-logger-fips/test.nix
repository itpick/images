{ pkgs, lib, ... }:

# TODO: Add tests for k8ssandra-system-logger-fips image
{
  name = "k8ssandra-system-logger-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8ssandra-system-logger-fips"
    exit 1
  '';
}
