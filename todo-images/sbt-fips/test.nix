{ pkgs, lib, ... }:

# TODO: Add tests for sbt-fips image
{
  name = "sbt-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sbt-fips"
    exit 1
  '';
}
