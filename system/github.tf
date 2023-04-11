provider "github" {
  organization = "jtamu"
}

resource "github_repository_webhook" "example" {
  repository = "deploy_test_app"

  configuration {
    url          = aws_codepipeline_webhook.example.url
    secret       = data.aws_ssm_parameter.webhook_secret.value
    content_type = "json"
    insecure_ssl = false
  }

  events = ["push"]
}
