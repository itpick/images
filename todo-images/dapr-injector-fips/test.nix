{ pkgs, lib, ... }:

# TODO: Add tests for dapr-injector-fips image
{
  name = "dapr-injector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dapr-injector-fips"
    exit 1
  '';
}
