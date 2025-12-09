{ pkgs, lib, ... }:

# TODO: Add tests for pgpool2 image
{
  name = "pgpool2";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgpool2"
    exit 1
  '';
}
