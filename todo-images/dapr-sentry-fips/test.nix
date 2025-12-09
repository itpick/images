{ pkgs, lib, ... }:

# TODO: Add tests for dapr-sentry-fips image
{
  name = "dapr-sentry-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dapr-sentry-fips"
    exit 1
  '';
}
