{ pkgs, lib, ... }:

# TODO: Add tests for dapr-operator-fips image
{
  name = "dapr-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dapr-operator-fips"
    exit 1
  '';
}
