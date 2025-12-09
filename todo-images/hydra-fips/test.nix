{ pkgs, lib, ... }:

# TODO: Add tests for hydra-fips image
{
  name = "hydra-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for hydra-fips"
    exit 1
  '';
}
