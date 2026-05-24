output "cloud_run_url" {
  value = google_cloud_run_v2_service.flask_service.uri
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.flask_repo.repository_id
}
