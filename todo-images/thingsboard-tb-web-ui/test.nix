{ pkgs, lib, ... }:

# TODO: Add tests for thingsboard-tb-web-ui image
{
  name = "thingsboard-tb-web-ui";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thingsboard-tb-web-ui"
    exit 1
  '';
}
