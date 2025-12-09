{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-cloudsqlproxy image
{
  name = "sigstore-scaffolding-cloudsqlproxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-cloudsqlproxy"
    exit 1
  '';
}
