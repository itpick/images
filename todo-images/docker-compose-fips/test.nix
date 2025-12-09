{ pkgs, lib, ... }:

# TODO: Add tests for docker-compose-fips image
{
  name = "docker-compose-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for docker-compose-fips"
    exit 1
  '';
}
