{ pkgs, lib, ... }:

# TODO: Add tests for kube-webhook-certgen-fips image
{
  name = "kube-webhook-certgen-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-webhook-certgen-fips"
    exit 1
  '';
}
