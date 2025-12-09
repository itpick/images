{ pkgs, lib, ... }:

# TODO: Add tests for spicedb-operator image
{
  name = "spicedb-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spicedb-operator"
    exit 1
  '';
}
