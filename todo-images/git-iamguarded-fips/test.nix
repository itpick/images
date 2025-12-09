{ pkgs, lib, ... }:

# TODO: Add tests for git-iamguarded-fips image
{
  name = "git-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for git-iamguarded-fips"
    exit 1
  '';
}
