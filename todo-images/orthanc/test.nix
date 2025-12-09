{ pkgs, lib, ... }:

# TODO: Add tests for orthanc image
{
  name = "orthanc";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for orthanc"
    exit 1
  '';
}
