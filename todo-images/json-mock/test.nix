{ pkgs, lib, ... }:

# TODO: Add tests for json-mock image
{
  name = "json-mock";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for json-mock"
    exit 1
  '';
}
