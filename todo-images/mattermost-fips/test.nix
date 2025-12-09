{ pkgs, lib, ... }:

# TODO: Add tests for mattermost-fips image
{
  name = "mattermost-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mattermost-fips"
    exit 1
  '';
}
