{ pkgs, lib, ... }:

# TODO: Add tests for httpd image
{
  name = "httpd";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for httpd"
    exit 1
  '';
}
