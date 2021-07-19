# Configure provider with your Cisco ACI credentials
provider "aci" {
  version = "0.3.4"
  # Cisco ACI user name
  username = apic_username
  # Cisco ACI password
  password = apic_password
  # Cisco ACI URL
  url      = apic_host
  insecure = true
}