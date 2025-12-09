{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-filter-fips image
{
  name = "knative-eventing-filter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-filter-fips"
    exit 1
  '';
}
