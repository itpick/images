{ pkgs, lib, ... }:

# TODO: Add tests for k8s-metadata-injection-fips image
{
  name = "k8s-metadata-injection-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-metadata-injection-fips"
    exit 1
  '';
}
