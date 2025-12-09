{ pkgs, lib, ... }:

# TODO: Add tests for spamcheck image
{
  name = "spamcheck";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spamcheck"
    exit 1
  '';
}
