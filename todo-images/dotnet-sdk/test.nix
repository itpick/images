{ pkgs, lib, ... }:

# TODO: Add tests for dotnet-sdk image
{
  name = "dotnet-sdk";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dotnet-sdk"
    exit 1
  '';
}
