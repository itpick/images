{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-fulcio-createcerts image
{
  name = "sigstore-scaffolding-fulcio-createcerts";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-fulcio-createcerts"
    exit 1
  '';
}
