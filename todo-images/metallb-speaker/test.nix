{ pkgs, lib, ... }:

# TODO: Add tests for metallb-speaker image
{
  name = "metallb-speaker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metallb-speaker"
    exit 1
  '';
}
