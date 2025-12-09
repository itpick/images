{ pkgs, lib, ... }:

# TODO: Add tests for postgres-cloudnative-pg image
{
  name = "postgres-cloudnative-pg";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-cloudnative-pg"
    exit 1
  '';
}
