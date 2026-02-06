
# Select GitHub and give access token
provider "github" {
  token = var.github-personal-access-token
}


# repository settings
# resource "serviceName" "ReferenceNameInsideCode" {}

resource "github_repository" "createGitRepoFromTerra" {
  name        = "anotherRepoCreatedWithTerraform"
  description = "This repository was created through terraform"

  visibility = "private"
}

