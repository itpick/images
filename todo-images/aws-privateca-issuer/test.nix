{ pkgs, lib, ... }:

# TODO: Add tests for aws-privateca-issuer image
{
  name = "aws-privateca-issuer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-privateca-issuer"
    exit 1
  '';
}
