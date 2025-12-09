{ pkgs, lib, ... }:

# TODO: Add tests for cloud-provider-aws-fips image
{
  name = "cloud-provider-aws-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-provider-aws-fips"
    exit 1
  '';
}
