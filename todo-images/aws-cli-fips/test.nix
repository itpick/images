{ pkgs, lib, ... }:

# TODO: Add tests for aws-cli-fips image
{
  name = "aws-cli-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-cli-fips"
    exit 1
  '';
}
