
variable "general_purpose_machine_type" {
  type = string
  description = "Machine type to use for the general-purpose node pool. See https://cloud.google.com/compute/docs/machine-types"
}

variable "general_purpose_image_type" {
  type = string
  description = "Image type to use for the general-purpose node pool. See https://cloud.google.com/compute/docs/image-types"
}

variable "general_purpose_min_node_count" {
  type = string
  description = "The minimum number of nodes PER ZONE in the general-purpose node pool"
  default = 1
}

variable "general_purpose_max_node_count" {
  type = string
  description = "The maximum number of nodes PER ZONE in the general-purpose node pool"
  default = 1
}

resource "google_container_cluster" "gdcluster" {
  name     = "${var.project}-cluster"
  location = var.region
  project = var.project

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "gd-node-pool" {
  name     = "${var.project}-node-pool"
  location = var.region
  cluster    = google_container_cluster.gdcluster.name

  management {
    auto_repair = "true"
    auto_upgrade = "true"
  }

  autoscaling {
    min_node_count = var.general_purpose_min_node_count
    max_node_count = var.general_purpose_max_node_count
  }
  initial_node_count = var.general_purpose_min_node_count

  node_config {
    image_type = var.general_purpose_image_type
    machine_type = var.general_purpose_machine_type

    labels = {
        use = "general"
        app = "any"
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }

    # Needed for correctly functioning cluster, see
    # https://www.terraform.io/docs/providers/google/r/container_cluster.html#oauth_scopes
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}
