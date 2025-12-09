{ pkgs, lib, ... }:

# TODO: Add tests for percona-server-fips image
{
  name = "percona-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for percona-server-fips"
    exit 1
  '';
}
