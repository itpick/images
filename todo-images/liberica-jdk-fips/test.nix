{ pkgs, lib, ... }:

# TODO: Add tests for liberica-jdk-fips image
{
  name = "liberica-jdk-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for liberica-jdk-fips"
    exit 1
  '';
}
