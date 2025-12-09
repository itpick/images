{ pkgs, lib, ... }:

# TODO: Add tests for cockroach image
{
  name = "cockroach";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cockroach"
    exit 1
  '';
}
