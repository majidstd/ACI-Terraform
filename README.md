

# Infrastructure as Code with Terraform

Terraform is an increasingly popular open-source infrastructure as code software tool built by HashiCorp. It enables administrators to define, provision and manage infrastructure across multiple cloud and datacenter resources. Terraform takes an infrastructure as code approach by using using a high-level configuration language known as Hashicorp Configuration Language or JSON to define the resources. Terraform differs from traditional configuration management tools such as Ansible as it is known for keeping state of the infrastructure, once you define your desired state through Terraform config files. Terraform looks to build your infrastucture, records its current state and always looks to maintain the desired state the config specifies. This is quite a key concept which we'll dig into more in Exercise 2.

While Terraform has been increasingly used in the cloud space to provision infrastructure such as VMWare, AWS and Azure, we're starting to see more and more usage of this with Cisco infrastructure with support today for ASA firewalls and Cisco ACI in the data centre (Application Centric Infrastructure). Within these exercises we'll look to focus on how Terraform can be used to configure ACI and provision resources in today's enterprise IT environment.

## Exercise 0 - Using Trraform Agent

Terraform Cloud Agents allow Terraform Cloud to communicate with isolated, private, or on-premises infrastructure. By deploying lightweight agents within a specific network segment, you can establish a simple connection between your environment and Terraform Cloud which allows for provisioning operations and management. This is useful for on-premises infrastructure types such as vSphere, Nutanix, OpenStack, enterprise networking providers, and anything you might have in a protected enclave.

The agent architecture is pull-based, so no inbound connectivity is required. Any agent you provision will poll Terraform Cloud for work and carry out execution of that work locally. To download the Terraform Agent executable you can run the command:

```
wget https://releases.hashicorp.com/tfc-agent/0.2.1/tfc-agent_0.2.1_linux_amd64.zip
```

When it downloads it will be zipped, you can unzip with the following command:

```
unzip ./ tfc-agent_0.2.1_linux_amd64.zip
```

Networking Requirements

In order for an agent to function properly, it must be able to make outbound requests over HTTPS (TCP port 443) to the Terraform Cloud application APIs. This may require perimeter networking as well as container host networking changes, depending on your environment. The IP ranges are documented in the Terraform Cloud IP Ranges documentation.

Additionally, the agent must also be able to communicate with any services required by the Terraform code it is executing. This includes the Terraform releases distribution service, releases.hashicorp.com (supported by Fastly), as well as any provider APIs. The services which run on these IP ranges are described in the table below.

Hostname                Port/Protocol	      Directionality	      Purpose
app.terraform.io        tcp/443, HTTPS	    Outbound	            Polling for new workloads, providing status updates
registry.terraform.io   tcp/443, HTTPS	    Outbound	            Downloading public modules from the Terraform Registry
releases.hashicorp.com	tcp/443, HTTPS	    Outbound	            Updating agent components and downloading Terraform binaries
archivist.terraform.io	tcp/443, HTTPS	    Outbound	            Blob Storage

## Exercise 1 - Code01 - creating our first resources on ACI with Terraform

In this exercise we're going to look at understanding an example terraform config file thats defines the resources we're looking to provision. In this case our configuration file looks to provision a tenant, bridge domain, subnet, application profile and a couple of example Endpoint groups related to the application. These are common tasks you'd look to do anytime you're deploying a new application. 



```
# Configure provider with your Cisco ACI credentials
provider "aci" {
  # Cisco ACI user name
  username = "apic admin username"
  # Cisco ACI password
  password = "apic-password"
  # Cisco ACI URL
  url      = "https://your-apic-ip"
  insecure = true
}
```

Cisco ACI Provider
The Cisco ACI terraform provider is used to interact with resources provided by Cisco APIC. The provider needs to be configured with proper credentials to authenticate with Cisco APIC. [website](https://www.terraform.io/docs/providers/aci/index.html).


First code will create basic tenant, bridge domain and a subnet.


## Exercise 2 - Code02 - Using Terraform Cloud Agent with ACI to create EPGs

in this excercise, you will create application Endpoint Groups(EPG). With this practise, you will get more familiar with ACI terraform code and you can add more advanced attribute in the configuration.

## Exercise 3 - Code03 - Using Terraform Cloud Agent with ACI to create contracts
in this excercise, you will create contracts, contract subjects and filters. after this deployment, you have a full set of application working end to end with web, app and db EPGs.

