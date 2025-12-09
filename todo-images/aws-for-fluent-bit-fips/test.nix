{ pkgs, lib, ... }:

# TODO: Add tests for aws-for-fluent-bit-fips image
{
  name = "aws-for-fluent-bit-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-for-fluent-bit-fips"
    exit 1
  '';
}
