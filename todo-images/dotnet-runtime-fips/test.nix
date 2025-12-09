{ pkgs, lib, ... }:

# TODO: Add tests for dotnet-runtime-fips image
{
  name = "dotnet-runtime-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dotnet-runtime-fips"
    exit 1
  '';
}
