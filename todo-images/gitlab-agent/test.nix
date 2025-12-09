{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-agent image
{
  name = "gitlab-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-agent"
    exit 1
  '';
}
