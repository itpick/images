{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-operator image
{
  name = "victoriametrics-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-operator"
    exit 1
  '';
}
