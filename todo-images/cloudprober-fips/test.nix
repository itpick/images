{ pkgs, lib, ... }:

# TODO: Add tests for cloudprober-fips image
{
  name = "cloudprober-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloudprober-fips"
    exit 1
  '';
}
