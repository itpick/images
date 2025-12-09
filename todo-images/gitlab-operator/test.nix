{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-operator image
{
  name = "gitlab-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-operator"
    exit 1
  '';
}
