{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-ctlog-managectroots image
{
  name = "sigstore-scaffolding-ctlog-managectroots";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-ctlog-managectroots"
    exit 1
  '';
}
