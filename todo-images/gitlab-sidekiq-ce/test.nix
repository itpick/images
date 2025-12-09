{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-sidekiq-ce image
{
  name = "gitlab-sidekiq-ce";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-sidekiq-ce"
    exit 1
  '';
}
