{ pkgs, lib, ... }:

# TODO: Add tests for git-sync image
{
  name = "git-sync";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for git-sync"
    exit 1
  '';
}
