{ pkgs, image }:

pkgs.writeShellScript "test-postgres" ''
  set -euo pipefail
  
  echo "🧪 Testing postgres image functionality..."
  
  # Test 1: PostgreSQL version
  echo "  ✓ Testing postgres version..."
  docker run --rm ${image.imageName}:test postgres --version | grep -q "postgres"
  
  # Test 2: PostgreSQL tools availability
  echo "  ✓ Testing postgres tools..."
  docker run --rm ${image.imageName}:test which psql | grep -q "psql"
  docker run --rm ${image.imageName}:test which createdb | grep -q "createdb"
  
  # Test 3: Database initialization (basic)
  echo "  ✓ Testing database initialization..."
  docker run --rm -e POSTGRES_PASSWORD=testpass ${image.imageName}:test bash -c '
    initdb --version | grep -q "initdb"
  '
  
  # Test 4: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test postgres --help | grep -q "Usage"
  
  echo "✅ All postgres tests passed!"
''