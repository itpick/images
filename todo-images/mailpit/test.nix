{ pkgs, lib, ... }:

# TODO: Add tests for mailpit image
{
  name = "mailpit";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mailpit"
    exit 1
  '';
}
