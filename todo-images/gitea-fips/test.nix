{ pkgs, lib, ... }:

# TODO: Add tests for gitea-fips image
{
  name = "gitea-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitea-fips"
    exit 1
  '';
}
