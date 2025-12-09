{ pkgs, lib, ... }:

# TODO: Add tests for apko image
{
  name = "apko";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apko"
    exit 1
  '';
}
