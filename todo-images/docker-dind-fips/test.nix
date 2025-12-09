{ pkgs, lib, ... }:

# TODO: Add tests for docker-dind-fips image
{
  name = "docker-dind-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for docker-dind-fips"
    exit 1
  '';
}
