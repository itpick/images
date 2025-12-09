{ pkgs, lib, ... }:

# TODO: Add tests for dapr-sentry image
{
  name = "dapr-sentry";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dapr-sentry"
    exit 1
  '';
}
