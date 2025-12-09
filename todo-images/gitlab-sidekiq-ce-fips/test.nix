{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-sidekiq-ce-fips image
{
  name = "gitlab-sidekiq-ce-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-sidekiq-ce-fips"
    exit 1
  '';
}
