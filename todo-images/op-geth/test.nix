{ pkgs, lib, ... }:

# TODO: Add tests for op-geth image
{
  name = "op-geth";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for op-geth"
    exit 1
  '';
}
