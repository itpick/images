{ pkgs, lib, ... }:

# TODO: Add tests for liberica-jre-fips image
{
  name = "liberica-jre-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for liberica-jre-fips"
    exit 1
  '';
}
