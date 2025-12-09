{ pkgs, lib, ... }:

# TODO: Add tests for ant-fips image
{
  name = "ant-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ant-fips"
    exit 1
  '';
}
