{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-notation-aws image
{
  name = "kyverno-notation-aws";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-notation-aws"
    exit 1
  '';
}
