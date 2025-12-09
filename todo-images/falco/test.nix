{ pkgs, lib, ... }:

# TODO: Add tests for falco image
{
  name = "falco";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falco"
    exit 1
  '';
}
