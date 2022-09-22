data "google_client_config" "current" {
}

provider "cdap" {
  host  = "https://{instance}-{project_id}-dot-usc1.datafusion.googleusercontent.com/api/"
  token = data.google_client_config.current.access_token
}

module "Teradata_1_7_0" {
  source = "./modules/hub_artifact"

  bucket           = "cdfhub-us-central1/hub"
  package          = "database-plugin-teradata-plugin"
  name             = "teradata-plugin"
  artifact_version = "1.7.0"
  namespace        = "DG"
}

module "Netezza_1_7_0" {
  source = "./modules/hub_artifact"

  bucket           = "cdfhub-us-central1/hub"
  package          = "database-plugin-netezza-plugin"
  name             = "netezza-plugin"
  artifact_version = "1.7.0"
  namespace        = "DG"
}
