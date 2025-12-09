{ pkgs, lib, ... }:

# TODO: Add tests for conda image
{
  name = "conda";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for conda"
    exit 1
  '';
}
