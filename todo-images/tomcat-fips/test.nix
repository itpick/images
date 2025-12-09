{ pkgs, lib, ... }:

# TODO: Add tests for tomcat-fips image
{
  name = "tomcat-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tomcat-fips"
    exit 1
  '';
}
