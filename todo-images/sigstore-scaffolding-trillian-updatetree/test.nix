{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-trillian-updatetree image
{
  name = "sigstore-scaffolding-trillian-updatetree";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-trillian-updatetree"
    exit 1
  '';
}
