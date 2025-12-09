{ pkgs, lib, ... }:

# TODO: Add tests for dotnet-runtime image
{
  name = "dotnet-runtime";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dotnet-runtime"
    exit 1
  '';
}
