{ pkgs, lib, ... }:

# TODO: Add tests for zitadel image
{
  name = "zitadel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for zitadel"
    exit 1
  '';
}
