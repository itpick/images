{ pkgs, lib, ... }:

# TODO: Add tests for management-api-for-apache-cassandra image
{
  name = "management-api-for-apache-cassandra";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for management-api-for-apache-cassandra"
    exit 1
  '';
}
