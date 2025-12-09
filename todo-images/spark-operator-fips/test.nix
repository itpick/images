{ pkgs, lib, ... }:

# TODO: Add tests for spark-operator-fips image
{
  name = "spark-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spark-operator-fips"
    exit 1
  '';
}
