{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmauth image
{
  name = "victoriametrics-vmauth";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmauth"
    exit 1
  '';
}
