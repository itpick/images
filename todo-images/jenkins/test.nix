{ pkgs, lib, ... }:

# TODO: Add tests for jenkins image
{
  name = "jenkins";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jenkins"
    exit 1
  '';
}
