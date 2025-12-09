{ pkgs, lib, ... }:

# TODO: Add tests for git-sync-fips image
{
  name = "git-sync-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for git-sync-fips"
    exit 1
  '';
}
