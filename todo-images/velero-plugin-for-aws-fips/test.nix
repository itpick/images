{ pkgs, lib, ... }:

# TODO: Add tests for velero-plugin-for-aws-fips image
{
  name = "velero-plugin-for-aws-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for velero-plugin-for-aws-fips"
    exit 1
  '';
}
