{ pkgs, lib, ... }:

# TODO: Add tests for apache-tika image
{
  name = "apache-tika";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-tika"
    exit 1
  '';
}
