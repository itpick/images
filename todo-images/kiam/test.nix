{ pkgs, lib, ... }:

# TODO: Add tests for kiam image
{
  name = "kiam";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kiam"
    exit 1
  '';
}
