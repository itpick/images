{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-iamguarded image
{
  name = "mongodb-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-iamguarded"
    exit 1
  '';
}
