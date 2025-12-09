{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-kas image
{
  name = "gitlab-kas";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-kas"
    exit 1
  '';
}
