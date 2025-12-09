{ pkgs, lib, ... }:

# TODO: Add tests for swift image
{
  name = "swift";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for swift"
    exit 1
  '';
}
