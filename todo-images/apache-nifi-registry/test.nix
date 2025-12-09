{ pkgs, lib, ... }:

# TODO: Add tests for apache-nifi-registry image
{
  name = "apache-nifi-registry";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-nifi-registry"
    exit 1
  '';
}
