{ pkgs, lib, ... }:

# TODO: Add tests for localstack image
{
  name = "localstack";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for localstack"
    exit 1
  '';
}
