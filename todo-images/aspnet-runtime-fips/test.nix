{ pkgs, lib, ... }:

# TODO: Add tests for aspnet-runtime-fips image
{
  name = "aspnet-runtime-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aspnet-runtime-fips"
    exit 1
  '';
}
