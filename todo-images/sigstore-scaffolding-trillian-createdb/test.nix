{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-trillian-createdb image
{
  name = "sigstore-scaffolding-trillian-createdb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-trillian-createdb"
    exit 1
  '';
}
