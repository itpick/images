{ pkgs, lib, ... }:

# TODO: Add tests for scanner-test image
{
  name = "scanner-test";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for scanner-test"
    exit 1
  '';
}
