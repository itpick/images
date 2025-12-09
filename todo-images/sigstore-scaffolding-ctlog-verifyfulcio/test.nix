{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-ctlog-verifyfulcio image
{
  name = "sigstore-scaffolding-ctlog-verifyfulcio";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-ctlog-verifyfulcio"
    exit 1
  '';
}
