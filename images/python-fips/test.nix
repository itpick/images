{ pkgs, image }:

pkgs.writeShellScript "test-python-fips" ''#!/bin/bash
set -euo pipefail

echo "🧪 Testing Python FIPS container..."

# Test 1: Basic container functionality
echo "📦 Test 1: Basic container run..."
if docker run --rm ${image.imageName}:test python3 --version; then
  echo "✅ Python version check passed"
else
  echo "❌ Python version check failed"
  exit 1
fi

# Test 2: FIPS readiness environment variables
echo "🔒 Test 2: FIPS readiness environment variables..."
FIPS_ENV=$(docker run --rm ${image.imageName}:test env | grep -E "(OPENSSL_FIPS_READY|FIPS_CONFIG_AVAILABLE)" || echo "")
if echo "$FIPS_ENV" | grep -q "OPENSSL_FIPS_READY=1" && echo "$FIPS_ENV" | grep -q "FIPS_CONFIG_AVAILABLE"; then
  echo "✅ FIPS readiness environment variables set correctly"
else
  echo "❌ FIPS readiness environment variables not set"
  echo "Found: $FIPS_ENV"
  exit 1
fi

# Test 3: FIPS configuration file
echo "🔐 Test 3: FIPS configuration file..."
if docker run --rm ${image.imageName}:test test -f /etc/fips/openssl.cnf; then
  echo "✅ FIPS OpenSSL configuration file present"
else
  echo "❌ FIPS OpenSSL configuration file missing"
  exit 1
fi

# Test 4: Python cryptography library
echo "🐍 Test 4: Python cryptography with FIPS..."
CRYPTO_TEST=$(docker run --rm ${image.imageName}:test python3 -c "
try:
    import ssl
    import hashlib
    print('SSL module loaded successfully')
    print('Available algorithms:', list(hashlib.algorithms_available))
    print('FIPS mode available:', hasattr(ssl, 'FIPS_mode'))
except Exception as e:
    print('Error:', e)
    exit(1)
" 2>&1)

if echo "$CRYPTO_TEST" | grep -q "SSL module loaded successfully"; then
  echo "✅ Python cryptography test passed"
  echo "Details: $CRYPTO_TEST"
else
  echo "❌ Python cryptography test failed"
  echo "Output: $CRYPTO_TEST"
  exit 1
fi

# Test 5: Package installation works normally
echo "📦 Test 5: Package installation..."
if docker run --rm ${image.imageName}:test pip --version >/dev/null 2>&1; then
  echo "✅ Package management works normally"
else
  echo "❌ Package management failed"
  exit 1
fi

# Test 6: Non-root user execution
echo "👤 Test 6: Non-root user execution..."
USER_INFO=$(docker run --rm ${image.imageName}:test id)
if echo "$USER_INFO" | grep -q "uid=65532(nonroot)"; then
  echo "✅ Running as non-root user"
else
  echo "❌ Not running as expected non-root user"
  echo "User info: $USER_INFO"
  exit 1
fi

echo "🎉 All Python FIPS-ready tests passed!"
''