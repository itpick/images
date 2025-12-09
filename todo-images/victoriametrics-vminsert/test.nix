{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vminsert image
{
  name = "victoriametrics-vminsert";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vminsert"
    exit 1
  '';
}
