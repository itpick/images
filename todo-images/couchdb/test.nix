{ pkgs, lib, ... }:

# TODO: Add tests for couchdb image
{
  name = "couchdb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for couchdb"
    exit 1
  '';
}
