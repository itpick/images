{ pkgs, lib, ... }:

# TODO: Add tests for zookeeper-iamguarded-fips image
{
  name = "zookeeper-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for zookeeper-iamguarded-fips"
    exit 1
  '';
}
