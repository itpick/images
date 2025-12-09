{ pkgs, lib, ... }:

# TODO: Add tests for opensearch-dashboards-fips image
{
  name = "opensearch-dashboards-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opensearch-dashboards-fips"
    exit 1
  '';
}
