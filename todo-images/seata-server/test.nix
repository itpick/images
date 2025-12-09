{ pkgs, lib, ... }:

# TODO: Add tests for seata-server image
{
  name = "seata-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for seata-server"
    exit 1
  '';
}
