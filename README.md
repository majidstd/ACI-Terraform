# **IST integration with ACI**

> _NOTE: Every use case should have this supporting document. A user can use this document and follow these steps to reproduce it in their environment._

## Infrastructure as Code with Terraform

Cisco Intersight Service for HashiCorp Terraform (IST) addresses the challenge of securely connecting and configuring on-premises and hybrid environments to work with Terraform Cloud Business Tier.
Leveraging Intersight Assist, users can integrate Terraform Cloud Business with Cisco Intersight, enabling secure communication between on-premises data centers and edge locations with the IaC platform. This means users can spend less time managing the end-to-end lifecycle of Terraform Cloud Agents, benefiting from native integration directly within Intersight, including upgrades and the ability to scale as demand grows.

In this example, we cover a how we can use IST to automatically configure Cisco ACI.

We will automate configuration of ACI’s logical constructs i.e. Tenant, Bridge domain, AP, EPG, Contracts, Filters to build a 3 tier application in ACI.

#### Requirements

1. Intersight SaaS platform account with Advantage licenses
2. An Intersight Assist appliance that is connected to your Intersight environment.
3. Terraform Cloud Business Tier Account
4. ACI Fabric
5. GitHub account to host your Terraform code.

Link to GitHub Repo
<https://github.com/majidstd/ACI-Terraform.git>

## Steps to Deploy Use Case

1. How to setup TFCB Account in Intersight
Login into your Intersight organization account, Claim Target and select Terraform Cloud:

![intersight_add_tfcb](/assets/intersight_add_tfcb.png)

Then fill out the required information:
Terraform Cloud Organization should be matched with Organization name in Terraform Cloud. Terraform Cloud Username/token will be your Terraform Cloud username and user token:

![tfcb_detail](/assets/tfcb_detail.png)