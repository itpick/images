{ pkgs, lib, ... }:

# TODO: Add tests for velero-fips image
{
  name = "velero-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for velero-fips"
    exit 1
  '';
}
