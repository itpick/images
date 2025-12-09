{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmagent image
{
  name = "victoriametrics-vmagent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmagent"
    exit 1
  '';
}
