
# Select GitHub and give access token
provider "github" {
  token = ""
}


# repository settings
# resource "serviceName" "ReferenceNameInsideCode" {} github_repository

resource "github_repository" "createRepo" {
  name        = "anotherMadeWithTerraform"
  description = "Made with terrafom"

  visibility = "public"
}




#commands: init, fmt, plan, apply, destroy