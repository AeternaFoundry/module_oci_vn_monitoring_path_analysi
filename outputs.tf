output "vn_monitoring_path_analysis_id" {
  description = "Map of id values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no id are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vn_monitoring_path_analysis_cache_control" {
  description = "Map of cache_control values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no cache_control are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => v.cache_control if v.cache_control != null && length(v.cache_control) > 0 }
}
output "vn_monitoring_path_analysis_compartment_id" {
  description = "Map of compartment_id values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no compartment_id are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "vn_monitoring_path_analysis_destination_endpoint" {
  description = "Map of destination_endpoint values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no destination_endpoint are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => one(v.destination_endpoint) if v.destination_endpoint != null && length(v.destination_endpoint) > 0 }
}
output "vn_monitoring_path_analysis_path_analyzer_test_id" {
  description = "Map of path_analyzer_test_id values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no path_analyzer_test_id are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => v.path_analyzer_test_id if v.path_analyzer_test_id != null && length(v.path_analyzer_test_id) > 0 }
}
output "vn_monitoring_path_analysis_protocol" {
  description = "Map of protocol values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no protocol are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => v.protocol if v.protocol != null }
}
output "vn_monitoring_path_analysis_protocol_parameters" {
  description = "Map of protocol_parameters values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no protocol_parameters are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => one(v.protocol_parameters) if v.protocol_parameters != null && length(v.protocol_parameters) > 0 }
}
output "vn_monitoring_path_analysis_query_options" {
  description = "Map of query_options values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no query_options are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => one(v.query_options) if v.query_options != null && length(v.query_options) > 0 }
}
output "vn_monitoring_path_analysis_source_endpoint" {
  description = "Map of source_endpoint values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no source_endpoint are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => one(v.source_endpoint) if v.source_endpoint != null && length(v.source_endpoint) > 0 }
}
output "vn_monitoring_path_analysis_type" {
  description = "Map of type values across all vn_monitoring_path_analysis, keyed the same as var.vn_monitoring_path_analysis except keys with no type are omitted"
  value       = { for k, v in oci_vn_monitoring_path_analysi.vn_monitoring_path_analysis : k => v.type if v.type != null && length(v.type) > 0 }
}

