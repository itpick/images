{ pkgs, lib, ... }:

# TODO: Add tests for spicedb image
{
  name = "spicedb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spicedb"
    exit 1
  '';
}
