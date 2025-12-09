{ pkgs, lib, ... }:

# TODO: Add tests for yunikorn-web image
{
  name = "yunikorn-web";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for yunikorn-web"
    exit 1
  '';
}
