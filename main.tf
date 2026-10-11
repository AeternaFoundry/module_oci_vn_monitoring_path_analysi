resource "oci_vn_monitoring_path_analysi" "vn_monitoring_path_analysis" {
  for_each = var.vn_monitoring_path_analysis

  type                  = each.value.type
  cache_control         = each.value.cache_control
  compartment_id        = each.value.compartment_id
  path_analyzer_test_id = each.value.path_analyzer_test_id
  protocol              = each.value.protocol

  dynamic "destination_endpoint" {
    for_each = each.value.destination_endpoint != null ? [each.value.destination_endpoint] : []
    content {
      address                  = destination_endpoint.value.address
      instance_id              = destination_endpoint.value.instance_id
      listener_id              = destination_endpoint.value.listener_id
      load_balancer_id         = destination_endpoint.value.load_balancer_id
      network_load_balancer_id = destination_endpoint.value.network_load_balancer_id
      psa_id                   = destination_endpoint.value.psa_id
      subnet_id                = destination_endpoint.value.subnet_id
      type                     = destination_endpoint.value.type
      vlan_id                  = destination_endpoint.value.vlan_id
      vnic_id                  = destination_endpoint.value.vnic_id
    }
  }

  dynamic "protocol_parameters" {
    for_each = each.value.protocol_parameters != null ? [each.value.protocol_parameters] : []
    content {
      destination_port = protocol_parameters.value.destination_port
      icmp_code        = protocol_parameters.value.icmp_code
      icmp_type        = protocol_parameters.value.icmp_type
      source_port      = protocol_parameters.value.source_port
      type             = protocol_parameters.value.type
    }
  }

  dynamic "query_options" {
    for_each = each.value.query_options != null ? [each.value.query_options] : []
    content {
      is_bi_directional_analysis = query_options.value.is_bi_directional_analysis
    }
  }

  dynamic "source_endpoint" {
    for_each = each.value.source_endpoint != null ? [each.value.source_endpoint] : []
    content {
      address                  = source_endpoint.value.address
      instance_id              = source_endpoint.value.instance_id
      listener_id              = source_endpoint.value.listener_id
      load_balancer_id         = source_endpoint.value.load_balancer_id
      network_load_balancer_id = source_endpoint.value.network_load_balancer_id
      psa_id                   = source_endpoint.value.psa_id
      subnet_id                = source_endpoint.value.subnet_id
      type                     = source_endpoint.value.type
      vlan_id                  = source_endpoint.value.vlan_id
      vnic_id                  = source_endpoint.value.vnic_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

