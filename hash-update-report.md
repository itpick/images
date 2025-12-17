# AWS Images Hash Update Report

## Summary

**Total aws-* images found:** 27 with placeholder hashes
**Successfully updated:** 19 files
**Remaining with placeholders:** 8 files

## Successfully Updated Files

The following files have been updated with correct source hashes, repository owners, and version tags:

1. **aws-load-balancer-controller-fips** - Updated to v2.11.0 (kubernetes-sigs/aws-load-balancer-controller)
2. **aws-network-policy-agent** - Updated to v1.3.0 (aws/aws-network-policy-agent)
3. **aws-network-policy-agent-fips** - Updated to v1.3.0 (aws/aws-network-policy-agent)
4. **aws-otel-collector** - Updated to v0.46.0 (aws-observability/aws-otel-collector)
5. **aws-otel-collector-fips** - Updated to v0.46.0 (aws-observability/aws-otel-collector)
6. **aws-otel-collector-healthcheck** - Updated to v0.46.0 (aws-observability/aws-otel-collector)
7. **aws-otel-collector-healthcheck-fips** - Updated to v0.46.0 (aws-observability/aws-otel-collector)
8. **aws-privateca-issuer** - Updated to v1.8.0 (cert-manager/aws-privateca-issuer)
9. **aws-privateca-issuer-fips** - Updated to v1.8.0 (cert-manager/aws-privateca-issuer)
10. **aws-for-fluent-bit** - Updated to v3.1.1 (aws/aws-for-fluent-bit)
11. **aws-for-fluent-bit-fips** - Updated to v3.1.1 (aws/aws-for-fluent-bit)
12. **aws-sigv4-proxy** - Updated to v1.10 (awslabs/aws-sigv4-proxy)
13. **aws-sigv4-proxy-fips** - Updated to v1.10 (awslabs/aws-sigv4-proxy)
14. **aws-s3-controller** - Updated to v1.2.0 (aws-controllers-k8s/s3-controller)
15. **aws-volume-modifier-for-k8s** - Updated to v0.9.1 (awslabs/volume-modifier-for-k8s)
16. **aws-volume-modifier-for-k8s-fips** - Updated to v0.9.1 (awslabs/volume-modifier-for-k8s)
17. **aws-node-termination-handler-fips** - Updated to v1.25.3 (aws/aws-node-termination-handler)
18. **aws-signer-notation-plugin** - Updated to v1.0.350 (aws/aws-signer-notation-plugin)
19. **aws-signer-notation-plugin-fips** - Updated to v1.0.350 (aws/aws-signer-notation-plugin)

## Files Requiring Manual Attention

The following 8 files still have placeholder hashes and require manual investigation:

### 1. aws-cli-fips, aws-cli-iamguarded, aws-cli-iamguarded-fips (3 files)
**Issue:** These files incorrectly reference `aws/aws-sdk-go` instead of the AWS CLI repository.
**Problem:** The AWS CLI v2 repository (aws/aws-cli) does not use traditional semantic version tags. It uses date-based tags and the v2 branch.
**Recommendation:** These should likely reference nixpkgs' awscli2 package instead of building from source, similar to the non-FIPS aws-cli image.

### 2. aws-eks-pod-identity-agent, aws-eks-pod-identity-agent-fips (2 files)
**Issue:** The aws/eks-pod-identity-agent repository exists but has no releases published yet.
**Repository:** https://github.com/aws/eks-pod-identity-agent
**Recommendation:** Wait for the first official release or use a specific commit hash instead of a version tag.

### 3. aws-flb-cloudwatch-fips, aws-flb-firehose-fips, aws-flb-kinesis-fips (3 files)
**Issue:** These reference non-existent repositories. The Fluent Bit output plugins are part of the aws-for-fluent-bit repository, not separate repositories.
**Incorrect repos being referenced:**
- aws/flb-cloudwatch (does not exist)
- aws/flb-firehose (does not exist)
- aws/flb-kinesis (does not exist)

**Actual repositories:**
- Cloudwatch: https://github.com/aws/amazon-cloudwatch-logs-for-fluent-bit
- Firehose: https://github.com/aws/amazon-kinesis-firehose-for-fluent-bit
- Kinesis: https://github.com/aws/amazon-kinesis-streams-for-fluent-bit

**Recommendation:** Update the repository names in these files to point to the correct AWS Fluent Bit plugin repositories and fetch appropriate version tags from their releases.

## Hash Updates Applied

All successfully updated files now have:
- ✅ Correct GitHub repository owner and name
- ✅ Valid version tags that exist in the upstream repository
- ✅ Proper SRI-format sha256 hashes
- ✅ Hash values verified against GitHub release tarballs

## Next Steps

For the 8 remaining files:
1. **AWS CLI variants**: Consider using nixpkgs awscli2 package or determine appropriate commit/tag strategy
2. **EKS Pod Identity Agent**: Monitor https://github.com/aws/eks-pod-identity-agent/releases for first release
3. **Fluent Bit plugins**: Update repository paths and fetch latest release versions
