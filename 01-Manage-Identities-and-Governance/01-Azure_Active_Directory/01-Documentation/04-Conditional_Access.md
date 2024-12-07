# Conditional Access in Azure Active Directory

Conditional Access policies allow organizations to enforce access controls based on user and device conditions.

## Key Components
- **Signals:** Evaluate conditions like user location, device compliance, and risk detection.
- **Decisions:** Define access decisions, such as allow, block, or require MFA.
- **Policies:** Combine signals and decisions into enforceable rules.

## Example Policies
| Scenario                    | Policy Description                                  | Documentation Link                                                                   |
|-----------------------------|----------------------------------------------------|--------------------------------------------------------------------------------------|
| **Secure Admin Access**     | Require MFA for administrative accounts.           | [Secure Admin Access](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-policies?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) |
| **Block Untrusted Locations** | Deny access from specific geographic locations.   | [Location-Based Access](https://learn.microsoft.com/entra/identity/conditional-access/concept-assignment-network?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) |

Learn more: [Azure Conditional Access](https://learn.microsoft.com/entra/identity/conditional-access/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
