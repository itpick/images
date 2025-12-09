{ pkgs, lib, ... }:

# TODO: Add tests for coredns image
{
  name = "coredns";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for coredns"
    exit 1
  '';
}
