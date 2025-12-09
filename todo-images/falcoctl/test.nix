{ pkgs, lib, ... }:

# TODO: Add tests for falcoctl image
{
  name = "falcoctl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falcoctl"
    exit 1
  '';
}
