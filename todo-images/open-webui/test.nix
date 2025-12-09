{ pkgs, lib, ... }:

# TODO: Add tests for open-webui image
{
  name = "open-webui";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for open-webui"
    exit 1
  '';
}
