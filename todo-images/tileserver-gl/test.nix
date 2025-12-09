{ pkgs, lib, ... }:

# TODO: Add tests for tileserver-gl image
{
  name = "tileserver-gl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tileserver-gl"
    exit 1
  '';
}
