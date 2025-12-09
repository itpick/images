{ pkgs, lib, ... }:

# TODO: Add tests for tomcat image
{
  name = "tomcat";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tomcat"
    exit 1
  '';
}
