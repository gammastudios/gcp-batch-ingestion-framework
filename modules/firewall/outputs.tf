
output "firewall_rule_internal" {
  value = "${google_compute_firewall.kubernetes-the-hard-way-allow-internal.name}"
}

output "firewall_rule_external" {
  value = "${google_compute_firewall.kubernetes-the-hard-way-allow-external.name}"
}
