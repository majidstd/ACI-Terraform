variable "apic_host" {
  type = string
  description = "Hostname or IP address of your APIC controller" 
}

variable "apic_user" {
  type = string
  description = "Username for apic"
}

variable "apic_pass" {
  type = string
  description = "The password for apic"
}

variable "vmm_center" {
  type = string
  description = "vmm networking dn"
}

variable "phys_dom" {
  type = string
  description = "physical domain"
}