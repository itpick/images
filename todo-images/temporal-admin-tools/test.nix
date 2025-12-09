{ pkgs, lib, ... }:

# TODO: Add tests for temporal-admin-tools image
{
  name = "temporal-admin-tools";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for temporal-admin-tools"
    exit 1
  '';
}
