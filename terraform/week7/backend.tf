terraform {
  backend "gcs" {
    bucket = "cis410-ryan-496413-bucket1-e59162c8"
    prefix = "week7/state"
  }
}
