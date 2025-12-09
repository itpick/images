{ pkgs, lib, ... }:

# TODO: Add tests for auditbeat-fips image
{
  name = "auditbeat-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for auditbeat-fips"
    exit 1
  '';
}
