{ pkgs, lib, ... }:

# TODO: Add tests for harbor-jobservice-fips image
{
  name = "harbor-jobservice-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-jobservice-fips"
    exit 1
  '';
}
