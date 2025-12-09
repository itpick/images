{ pkgs, lib, ... }:

# TODO: Add tests for secretgen-controller-fips image
{
  name = "secretgen-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secretgen-controller-fips"
    exit 1
  '';
}
