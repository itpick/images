{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-trillian-createtree image
{
  name = "sigstore-scaffolding-trillian-createtree";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-trillian-createtree"
    exit 1
  '';
}
