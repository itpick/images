{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-function-go-templating-fips image
{
  name = "crossplane-function-go-templating-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-function-go-templating-fips"
    exit 1
  '';
}
