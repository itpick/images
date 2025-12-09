{ pkgs, lib, ... }:

# TODO: Add tests for openbao image
{
  name = "openbao";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openbao"
    exit 1
  '';
}
