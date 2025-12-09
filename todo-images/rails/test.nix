{ pkgs, lib, ... }:

# TODO: Add tests for rails image
{
  name = "rails";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rails"
    exit 1
  '';
}
