{ pkgs, lib, ... }:

# TODO: Add tests for apache-hop image
{
  name = "apache-hop";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-hop"
    exit 1
  '';
}
