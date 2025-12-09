{ pkgs, lib, ... }:

# TODO: Add tests for docker-cli-fips image
{
  name = "docker-cli-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for docker-cli-fips"
    exit 1
  '';
}
