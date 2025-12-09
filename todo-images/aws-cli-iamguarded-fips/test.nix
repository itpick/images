{ pkgs, lib, ... }:

# TODO: Add tests for aws-cli-iamguarded-fips image
{
  name = "aws-cli-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-cli-iamguarded-fips"
    exit 1
  '';
}
