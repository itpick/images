{ pkgs, lib, ... }:

# TODO: Add tests for openssh-server-fips image
{
  name = "openssh-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openssh-server-fips"
    exit 1
  '';
}
