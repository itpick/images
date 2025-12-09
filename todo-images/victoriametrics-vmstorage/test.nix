{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmstorage image
{
  name = "victoriametrics-vmstorage";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmstorage"
    exit 1
  '';
}
