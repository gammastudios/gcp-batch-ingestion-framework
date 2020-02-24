
output "instance_name" {
  value = "${google_compute_instance.compute_kubernetes_control_plane.*.name}"
}

output "external_with_subnet_and_address" {
  value = "${google_compute_address.external_with_subnet_and_address.address}" 
}
