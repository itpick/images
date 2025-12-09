{ pkgs, lib, ... }:

# TODO: Add tests for rsyslog-fips image
{
  name = "rsyslog-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rsyslog-fips"
    exit 1
  '';
}
