data "external" "credentials" {
  program  = [ "cat", "./secrets/credentials.json"]
}

provider "aws" {
  access_key = "${data.external.credentials.result.access_key}"
  secret_key = "${data.external.credentials.result.secret_key}"
  region = "us-west-2"
}
