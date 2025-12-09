{ pkgs, lib, ... }:

# TODO: Add tests for rqlite image
{
  name = "rqlite";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rqlite"
    exit 1
  '';
}
