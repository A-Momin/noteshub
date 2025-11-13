-   <details><summary style="font-size:25px;color:Orange">Cybersecurity Tools and Technology in context of AWS</summary>

    Below is a **comprehensive, structured list** of AWS-native and integrated security tools — categorized by their function within the **Cloud Security Framework**.

    ## 🧠 1. AWS Cybersecurity Landscape Overview

    AWS cybersecurity can be divided into **6 major domains**:

    | Domain                            | Focus                                                |
    | --------------------------------- | ---------------------------------------------------- |
    | 🔐 Identity & Access Management   | Controlling who can access what                      |
    | 🌐 Network Security               | Protecting VPCs, subnets, load balancers, endpoints  |
    | 🧱 Data Protection                | Encryption, key management, DLP                      |
    | 🧩 Threat Detection & Monitoring  | Real-time threat discovery, alerts, analytics        |
    | 🧾 Compliance & Governance        | Audit, compliance, resource configuration            |
    | 🧰 Incident Response & Automation | Detecting, responding, and remediating automatically |

    ## 🔐 2. **Identity and Access Management Tools**

    | Tool / Service                        | Description                                      | Key Capabilities                                           |
    | ------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------- |
    | **AWS IAM**                           | Core identity management service                 | Users, roles, policies, permissions boundaries, federation |
    | **AWS IAM Identity Center (SSO)**     | Centralized user access to multiple AWS accounts | Single sign-on, SAML integration, user groups              |
    | **AWS Organizations**                 | Manage multi-account environments                | SCPs (Service Control Policies), consolidated billing      |
    | **AWS STS (Security Token Service)**  | Provides temporary credentials                   | Used in cross-account or federated access                  |
    | **AWS Cognito**                       | End-user authentication for apps                 | User pool, federated identity pool, JWT tokens             |
    | **AWS Resource Access Manager (RAM)** | Securely share resources across accounts         | Resource sharing with granular control                     |

    ## 🌐 3. **Network and Infrastructure Security Tools**

    | Tool / Service                         | Description                                     | Key Features                                                 |
    | -------------------------------------- | ----------------------------------------------- | ------------------------------------------------------------ |
    | **AWS VPC (Virtual Private Cloud)**    | Core network isolation environment              | Subnets, route tables, gateways                              |
    | **AWS Security Groups**                | Virtual firewalls at instance level             | Stateful filtering (inbound/outbound)                        |
    | **AWS Network ACLs**                   | Subnet-level firewall                           | Stateless rules for traffic control                          |
    | **AWS WAF (Web Application Firewall)** | Protects web apps from OWASP Top 10 threats     | SQLi, XSS, bot control, IP blocking                          |
    | **AWS Shield**                         | DDoS protection                                 | Shield Standard (auto), Shield Advanced (24×7 DDoS response) |
    | **AWS Firewall Manager**               | Centralized management for WAF, Shield, and SGs | Policy-based security across accounts                        |
    | **AWS CloudFront Security (with WAF)** | Secure CDN edge protection                      | TLS termination, geo-restriction, DDoS resilience            |
    | **AWS Network Firewall**               | Managed firewall for VPCs                       | Deep packet inspection, rule groups, Suricata-compatible     |
    | **VPC Flow Logs**                      | Network traffic logging                         | IP-level visibility for troubleshooting or threat hunting    |
    | **AWS PrivateLink**                    | Private connectivity between services           | Eliminates exposure to public Internet                       |
    | **AWS Transit Gateway**                | Central routing hub for hybrid networks         | Interconnect multiple VPCs and on-prem networks              |

    ## 🧱 4. **Data Protection and Encryption**

    | Tool / Service                          | Description                              | Encryption Type                               |
    | --------------------------------------- | ---------------------------------------- | --------------------------------------------- |
    | **AWS KMS (Key Management Service)**    | Centralized key management               | Envelope encryption (AES-256)                 |
    | **AWS CloudHSM**                        | Dedicated hardware security module       | FIPS 140-2 Level 3 compliance                 |
    | **AWS Secrets Manager**                 | Secure storage of credentials & API keys | Rotation, encryption, fine-grained IAM access |
    | **AWS Systems Manager Parameter Store** | Config & secrets storage                 | Encrypted parameters using KMS                |
    | **AWS S3 Encryption**                   | Encrypt data at rest in S3               | SSE-S3, SSE-KMS, or SSE-C                     |
    | **EBS Encryption**                      | Volume-level encryption                  | Automatic, KMS-integrated                     |
    | **RDS Encryption**                      | At-rest encryption for DBs               | KMS-integrated; supports SSL/TLS in transit   |
    | **Aurora & DynamoDB Encryption**        | Data encryption at rest and in transit   | KMS-managed                                   |
    | **AWS Certificate Manager (ACM)**       | SSL/TLS certificate management           | Auto-renewal and ALB integration              |

    ## 🧩 5. **Threat Detection, Monitoring & Logging**

    | Tool / Service               | Description                                  | Key Features                                                     |
    | ---------------------------- | -------------------------------------------- | ---------------------------------------------------------------- |
    | **AWS CloudTrail**           | Governance, compliance, and API auditing     | Logs all API calls across AWS                                    |
    | **AWS CloudWatch**           | Monitoring and observability                 | Metrics, logs, alarms, dashboards                                |
    | **AWS GuardDuty**            | Intelligent threat detection                 | ML-based detection of malicious activity or compromised accounts |
    | **AWS Detective**            | Security investigation and forensics         | Visual graph analysis of GuardDuty/CloudTrail/VPC Flow data      |
    | **AWS Security Hub**         | Unified security visibility dashboard        | Aggregates findings from GuardDuty, Config, Macie, etc.          |
    | **Amazon Inspector**         | Automated vulnerability scanning             | EC2, ECR, Lambda scanning for CVEs or misconfigurations          |
    | **AWS Macie**                | Data security for S3                         | Automatically discovers and classifies sensitive data (PII)      |
    | **AWS Config**               | Resource inventory and compliance evaluation | Tracks configuration changes and rule compliance                 |
    | **CloudWatch Logs Insights** | Log analytics                                | Query logs for anomaly detection and incident response           |
    | **AWS Audit Manager**        | Continuous compliance audit preparation      | Automates evidence collection for frameworks like ISO, SOC2      |

    ## 🧰 6. **Incident Response and Automation**

    | Tool / Service                            | Description                      | Use Case                                               |
    | ----------------------------------------- | -------------------------------- | ------------------------------------------------------ |
    | **AWS Lambda**                            | Event-driven compute             | Automated remediation (e.g., delete public S3 objects) |
    | **AWS Step Functions**                    | Orchestrates security workflows  | Multi-step response playbooks                          |
    | **AWS Systems Manager (SSM)**             | Fleet management and runbooks    | Patch automation, investigation at scale               |
    | **AWS SNS (Simple Notification Service)** | Alerting and messaging           | Security event notifications                           |
    | **AWS EventBridge**                       | Event-driven security automation | Trigger Lambda/Step Functions on GuardDuty findings    |
    | **AWS Service Catalog / Control Tower**   | Secure baseline setup            | Enforce security guardrails for new accounts           |
    | **AWS Backup**                            | Centralized backup and recovery  | Policy-based backup with encryption                    |
    | **AWS CloudFormation Guard**              | Policy-as-code for IaC security  | Validate templates against security rules              |

    ## 🧾 7. **Governance, Risk & Compliance (GRC)**

    | Tool / Service                                  | Description                                    | Use Case                                          |
    | ----------------------------------------------- | ---------------------------------------------- | ------------------------------------------------- |
    | **AWS Artifact**                                | Self-service portal for AWS compliance reports | Access ISO, SOC, PCI reports                      |
    | **AWS Config Conformance Packs**                | Bundled compliance rules                       | CIS, NIST, PCI DSS frameworks                     |
    | **AWS Control Tower**                           | Governance at scale for multi-account setup    | Enforces security guardrails                      |
    | **AWS Trusted Advisor**                         | Security and cost optimization checks          | Public S3 detection, IAM key rotation             |
    | **AWS Well-Architected Tool (Security Pillar)** | Architecture review framework                  | Guidance and best practices                       |
    | **AWS Access Analyzer**                         | IAM policy analyzer                            | Detects unintended public or cross-account access |

    ## 🧮 8. **Third-Party Security Integrations (Marketplace & SIEM)**

    | Category                                     | Example Tools                                               |
    | -------------------------------------------- | ----------------------------------------------------------- |
    | **SIEM / SOAR**                              | Splunk, IBM QRadar, Datadog Security, Panther, Sumo Logic   |
    | **Endpoint Security (EDR)**                  | CrowdStrike, Trend Micro Deep Security, Sophos, SentinelOne |
    | **Cloud Security Posture Management (CSPM)** | Wiz, Prisma Cloud, Orca Security                            |
    | **Data Loss Prevention (DLP)**               | Netskope, Symantec CloudSOC                                 |
    | **Threat Intelligence**                      | AWS GuardDuty + Recorded Future, Anomali, ThreatConnect     |

    ## 🧱 9. **Security Automation Example Flow**

    **Use case:** Detect and auto-remediate a public S3 bucket.

    1. **GuardDuty** detects anomaly or S3 public access.
    2. **EventBridge** triggers a **Lambda function**.
    3. **Lambda** updates bucket ACL or policy → sets it private.
    4. **SNS** sends alert to Security team.
    5. **CloudWatch Logs** record the event for audit.
    6. **Config Rule** validates compliance.

    ## 🧾 10. **Summary Map**

    | Security Layer       | Key AWS Services                                 |
    | -------------------- | ------------------------------------------------ |
    | **Identity**         | IAM, SSO, STS, Cognito                           |
    | **Network**          | VPC, SG, NACL, WAF, Shield, Firewall Manager     |
    | **Data Protection**  | KMS, CloudHSM, Secrets Manager, ACM              |
    | **Threat Detection** | GuardDuty, Inspector, Macie, Security Hub        |
    | **Governance**       | Config, Audit Manager, Artifact, Trusted Advisor |
    | **Automation**       | Lambda, Step Functions, EventBridge, SSM         |

    </details>
