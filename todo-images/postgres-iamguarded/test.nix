{ pkgs, lib, ... }:

# TODO: Add tests for postgres-iamguarded image
{
  name = "postgres-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-iamguarded"
    exit 1
  '';
}
