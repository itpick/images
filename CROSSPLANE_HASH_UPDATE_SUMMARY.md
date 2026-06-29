# Crossplane Hash Update Summary

## Successfully Updated Files (15 files)

The following files have been successfully updated with correct source hashes:

1. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-aws-provider/default.nix`
   - Hash: `sha256-ODqNay4wmbo770ZBpGSH/Zm2Y2vVmUC6PfTzv9CyZns=`
   - Repo: crossplane/crossplane v2.1.3

2. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-function-environment-configs/default.nix`
   - Hash: `sha256-cIX9PQRzn8jhEv7gfpos9k4vEbvnbdSxPP8xwfFdpMk=`
   - Repo: crossplane-contrib/function-environment-configs v0.1.0

3. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-aws/default.nix`
   - Hash: `sha256-ng6LoxNnow8RkhIBa+CdKEToCQdA4eEY0JhzuxPSqlU=`
   - Repo: crossplane-contrib/provider-aws v0.54.0

4. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-azure/default.nix`
   - Hash: `sha256-qg+6pIWsRpO0mXjdzn4JtcHD97y7C2pKgnwqvBxc2IU=`
   - Repo: crossplane-contrib/provider-azure v1.0.0

5. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-gcp/default.nix`
   - Hash: `sha256-A4wrBy8zNtbKF6zFPoJHGHqPbPZSUVbWzX0TJvfVAuo=`
   - Repo: crossplane-contrib/provider-gcp v1.0.0

6. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-gitlab-fips/default.nix`
   - Hash: `sha256-moluGWbxFW+2Uq29jgL0w+f7fp0NLbJ4CDzmiojIbpg=`
   - Repo: crossplane-contrib/provider-gitlab v0.1.0

7. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-gitlab/default.nix`
   - Hash: `sha256-moluGWbxFW+2Uq29jgL0w+f7fp0NLbJ4CDzmiojIbpg=`
   - Repo: crossplane-contrib/provider-gitlab v0.1.0

8. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-keycloak-fips/default.nix`
   - Hash: `sha256-eVDHLd/pOICGL4zkmWXOBG9tyOAheg64XeWZsOHI9vU=`
   - Repo: crossplane-contrib/provider-keycloak v0.1.0

9. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-keycloak/default.nix`
   - Hash: `sha256-eVDHLd/pOICGL4zkmWXOBG9tyOAheg64XeWZsOHI9vU=`
   - Repo: crossplane-contrib/provider-keycloak v0.1.0

10. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-kubernetes-fips/default.nix`
    - Hash: `sha256-Rb+plMyBivFNCKJSUnkLkV5vmH+pbIGsI2RjQ9HTnQg=`
    - Repo: crossplane-contrib/provider-kubernetes v0.1.0

11. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-kubernetes/default.nix`
    - Hash: `sha256-Rb+plMyBivFNCKJSUnkLkV5vmH+pbIGsI2RjQ9HTnQg=`
    - Repo: crossplane-contrib/provider-kubernetes v0.1.0

12. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-sql-fips/default.nix`
    - Hash: `sha256-bWHqUZR0NgZxaPMsDbtr3bSyKdntKle0+YxabSXbf50=`
    - Repo: crossplane-contrib/provider-sql v0.1.0

13. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-sql/default.nix`
    - Hash: `sha256-bWHqUZR0NgZxaPMsDbtr3bSyKdntKle0+YxabSXbf50=`
    - Repo: crossplane-contrib/provider-sql v0.1.0

14. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-terraform-fips/default.nix`
    - Hash: `sha256-p7zkijkhnjOTRxBRPG5z5hrApvsGyP/vCYGPua8aQ+A=`
    - Repo: crossplane-contrib/provider-terraform v0.1.0

15. `/Users/lucaspick/workspace/drduker/nix-containers/images/images/crossplane-provider-terraform/default.nix`
    - Hash: `sha256-p7zkijkhnjOTRxBRPG5z5hrApvsGyP/vCYGPua8aQ+A=`
    - Repo: crossplane-contrib/provider-terraform v0.1.0

## Failed Updates (112 files)

The remaining 112 files failed to update because the specified version tags do not exist in the GitHub repositories. Common issues:

- **Version v1.0.0 doesn't exist** for many provider-aws family repositories (most specify v1.0.0 but the repos don't have this tag)
- **Version v0.1.0 doesn't exist** for some function and provider repositories
- **Incorrect repository references** in some files (e.g., azure files pointing to provider-aws repo)

These files require manual correction of either:
1. The version number to match an existing Git tag
2. The owner/repo fields to point to the correct repository

## Notes

- Only source hashes were updated (first occurrence in each file)
- vendorHash fields remain unchanged with placeholder values as requested
- All updated files have been verified with git diff
- A full processing log is available at: `data-gathering/crossplane_hash_fix.log`
