{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-toolbox-ce image
{
  name = "gitlab-toolbox-ce";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-toolbox-ce"
    exit 1
  '';
}
