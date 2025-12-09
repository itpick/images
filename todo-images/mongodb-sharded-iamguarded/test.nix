{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-sharded-iamguarded image
{
  name = "mongodb-sharded-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-sharded-iamguarded"
    exit 1
  '';
}
