{ pkgs, lib, ... }:

# TODO: Add tests for flannel image
{
  name = "flannel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flannel"
    exit 1
  '';
}
