{ pkgs, lib, ... }:

# TODO: Add tests for skopeo image
{
  name = "skopeo";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for skopeo"
    exit 1
  '';
}
