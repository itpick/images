{ pkgs, lib, ... }:

# TODO: Add tests for verticadb-operator image
{
  name = "verticadb-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for verticadb-operator"
    exit 1
  '';
}
