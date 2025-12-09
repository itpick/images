{ pkgs, lib, ... }:

# TODO: Add tests for dotnet-sdk-fips image
{
  name = "dotnet-sdk-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dotnet-sdk-fips"
    exit 1
  '';
}
