{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-agent-fips image
{
  name = "gitlab-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-agent-fips"
    exit 1
  '';
}
