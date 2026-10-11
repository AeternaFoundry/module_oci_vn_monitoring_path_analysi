variable "vn_monitoring_path_analysis" {
  description = <<EOT
Map of vn_monitoring_path_analysis, attributes below
Required:
    - type
Optional:
    - cache_control
    - compartment_id
    - path_analyzer_test_id
    - protocol
    - destination_endpoint (block):
        - address (optional)
        - instance_id (optional)
        - listener_id (optional)
        - load_balancer_id (optional)
        - network_load_balancer_id (optional)
        - psa_id (optional)
        - subnet_id (optional)
        - type (required)
        - vlan_id (optional)
        - vnic_id (optional)
    - protocol_parameters (block):
        - destination_port (optional)
        - icmp_code (optional)
        - icmp_type (optional)
        - source_port (optional)
        - type (required)
    - query_options (block):
        - is_bi_directional_analysis (optional)
    - source_endpoint (block):
        - address (optional)
        - instance_id (optional)
        - listener_id (optional)
        - load_balancer_id (optional)
        - network_load_balancer_id (optional)
        - psa_id (optional)
        - subnet_id (optional)
        - type (required)
        - vlan_id (optional)
        - vnic_id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    type                  = string
    cache_control         = optional(string)
    compartment_id        = optional(string)
    path_analyzer_test_id = optional(string)
    protocol              = optional(number)
    destination_endpoint = optional(object({
      address                  = optional(string)
      instance_id              = optional(string)
      listener_id              = optional(string)
      load_balancer_id         = optional(string)
      network_load_balancer_id = optional(string)
      psa_id                   = optional(string)
      subnet_id                = optional(string)
      type                     = string
      vlan_id                  = optional(string)
      vnic_id                  = optional(string)
    }))
    protocol_parameters = optional(object({
      destination_port = optional(number)
      icmp_code        = optional(number)
      icmp_type        = optional(number)
      source_port      = optional(number)
      type             = string
    }))
    query_options = optional(object({
      is_bi_directional_analysis = optional(bool)
    }))
    source_endpoint = optional(object({
      address                  = optional(string)
      instance_id              = optional(string)
      listener_id              = optional(string)
      load_balancer_id         = optional(string)
      network_load_balancer_id = optional(string)
      psa_id                   = optional(string)
      subnet_id                = optional(string)
      type                     = string
      vlan_id                  = optional(string)
      vnic_id                  = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vn_monitoring_path_analysis : (
        contains([for v in ["ADHOC_QUERY", "PERSISTED_QUERY"] : lower(v)], lower(v.type))
      )
    ])
    error_message = "must be one of: \"ADHOC_QUERY\", \"PERSISTED_QUERY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.vn_monitoring_path_analysis : (
        v.destination_endpoint == null || (contains([for v in ["COMPUTE_INSTANCE", "IP_ADDRESS", "LOAD_BALANCER", "LOAD_BALANCER_LISTENER", "NETWORK_LOAD_BALANCER", "NETWORK_LOAD_BALANCER_LISTENER", "ON_PREM", "PRIVATE_SERVICE_ACCESS", "SUBNET", "VLAN", "VNIC"] : lower(v)], lower(v.destination_endpoint.type)))
      )
    ])
    error_message = "must be one of: \"COMPUTE_INSTANCE\", \"IP_ADDRESS\", \"LOAD_BALANCER\", \"LOAD_BALANCER_LISTENER\", \"NETWORK_LOAD_BALANCER\", \"NETWORK_LOAD_BALANCER_LISTENER\", \"ON_PREM\", \"PRIVATE_SERVICE_ACCESS\", \"SUBNET\", \"VLAN\", \"VNIC\""
  }
  validation {
    condition = alltrue([
      for k, v in var.vn_monitoring_path_analysis : (
        v.protocol_parameters == null || (contains([for v in ["ICMP", "TCP", "UDP"] : lower(v)], lower(v.protocol_parameters.type)))
      )
    ])
    error_message = "must be one of: \"ICMP\", \"TCP\", \"UDP\""
  }
  validation {
    condition = alltrue([
      for k, v in var.vn_monitoring_path_analysis : (
        v.source_endpoint == null || (contains([for v in ["COMPUTE_INSTANCE", "IP_ADDRESS", "LOAD_BALANCER", "LOAD_BALANCER_LISTENER", "NETWORK_LOAD_BALANCER", "NETWORK_LOAD_BALANCER_LISTENER", "ON_PREM", "PRIVATE_SERVICE_ACCESS", "SUBNET", "VLAN", "VNIC"] : lower(v)], lower(v.source_endpoint.type)))
      )
    ])
    error_message = "must be one of: \"COMPUTE_INSTANCE\", \"IP_ADDRESS\", \"LOAD_BALANCER\", \"LOAD_BALANCER_LISTENER\", \"NETWORK_LOAD_BALANCER\", \"NETWORK_LOAD_BALANCER_LISTENER\", \"ON_PREM\", \"PRIVATE_SERVICE_ACCESS\", \"SUBNET\", \"VLAN\", \"VNIC\""
  }
}

