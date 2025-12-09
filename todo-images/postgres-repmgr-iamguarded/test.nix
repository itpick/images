{ pkgs, lib, ... }:

# TODO: Add tests for postgres-repmgr-iamguarded image
{
  name = "postgres-repmgr-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-repmgr-iamguarded"
    exit 1
  '';
}
