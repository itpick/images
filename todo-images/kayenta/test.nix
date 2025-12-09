{ pkgs, lib, ... }:

# TODO: Add tests for kayenta image
{
  name = "kayenta";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kayenta"
    exit 1
  '';
}
