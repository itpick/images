{ pkgs, lib, ... }:

# TODO: Add tests for vault-secrets-operator image
{
  name = "vault-secrets-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vault-secrets-operator"
    exit 1
  '';
}
