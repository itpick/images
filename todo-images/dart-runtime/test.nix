{ pkgs, lib, ... }:

# TODO: Add tests for dart-runtime image
{
  name = "dart-runtime";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dart-runtime"
    exit 1
  '';
}
