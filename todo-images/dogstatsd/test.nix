{ pkgs, lib, ... }:

# TODO: Add tests for dogstatsd image
{
  name = "dogstatsd";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dogstatsd"
    exit 1
  '';
}
