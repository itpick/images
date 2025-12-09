{ pkgs, lib, ... }:

# TODO: Add tests for pgpool2-iamguarded image
{
  name = "pgpool2-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgpool2-iamguarded"
    exit 1
  '';
}
