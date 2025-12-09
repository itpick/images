{ pkgs, lib, ... }:

# TODO: Add tests for fluent-operator image
{
  name = "fluent-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluent-operator"
    exit 1
  '';
}
