{ pkgs, lib, ... }:

# TODO: Add tests for wiremock image
{
  name = "wiremock";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wiremock"
    exit 1
  '';
}
