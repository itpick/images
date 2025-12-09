{ pkgs, lib, ... }:

# TODO: Add tests for dapr-injector image
{
  name = "dapr-injector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dapr-injector"
    exit 1
  '';
}
