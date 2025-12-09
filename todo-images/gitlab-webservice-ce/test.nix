{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-webservice-ce image
{
  name = "gitlab-webservice-ce";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-webservice-ce"
    exit 1
  '';
}
