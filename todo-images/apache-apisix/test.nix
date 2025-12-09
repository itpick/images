{ pkgs, lib, ... }:

# TODO: Add tests for apache-apisix image
{
  name = "apache-apisix";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-apisix"
    exit 1
  '';
}
