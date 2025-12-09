{ pkgs, lib, ... }:

# TODO: Add tests for git-iamguarded image
{
  name = "git-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for git-iamguarded"
    exit 1
  '';
}
