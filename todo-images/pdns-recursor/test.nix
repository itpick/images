{ pkgs, lib, ... }:

# TODO: Add tests for pdns-recursor image
{
  name = "pdns-recursor";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pdns-recursor"
    exit 1
  '';
}
