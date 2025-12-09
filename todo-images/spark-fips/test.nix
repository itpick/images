{ pkgs, lib, ... }:

# TODO: Add tests for spark-fips image
{
  name = "spark-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spark-fips"
    exit 1
  '';
}
