{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-remote-storage-fips image
{
  name = "jaeger-remote-storage-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-remote-storage-fips"
    exit 1
  '';
}
