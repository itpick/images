{ pkgs, lib, ... }:

# TODO: Add tests for nacos image
{
  name = "nacos";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nacos"
    exit 1
  '';
}
