{ pkgs, lib, ... }:

# TODO: Add tests for atmoz-sftp-fips image
{
  name = "atmoz-sftp-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for atmoz-sftp-fips"
    exit 1
  '';
}
