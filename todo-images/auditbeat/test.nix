{ pkgs, lib, ... }:

# TODO: Add tests for auditbeat image
{
  name = "auditbeat";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for auditbeat"
    exit 1
  '';
}
