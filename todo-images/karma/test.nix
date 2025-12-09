{ pkgs, lib, ... }:

# TODO: Add tests for karma image
{
  name = "karma";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for karma"
    exit 1
  '';
}
