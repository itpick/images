{ pkgs, lib, ... }:

# TODO: Add tests for dapr-daprd-fips image
{
  name = "dapr-daprd-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dapr-daprd-fips"
    exit 1
  '';
}
