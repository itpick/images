{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmselect image
{
  name = "victoriametrics-vmselect";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmselect"
    exit 1
  '';
}
