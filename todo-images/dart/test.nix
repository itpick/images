{ pkgs, lib, ... }:

# TODO: Add tests for dart image
{
  name = "dart";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dart"
    exit 1
  '';
}
