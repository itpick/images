{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-exporter-fips image
{
  name = "gitlab-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-exporter-fips"
    exit 1
  '';
}
