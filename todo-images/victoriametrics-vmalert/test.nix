{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmalert image
{
  name = "victoriametrics-vmalert";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmalert"
    exit 1
  '';
}
