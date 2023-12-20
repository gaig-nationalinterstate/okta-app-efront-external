# efront App
resource "okta_app_saml" "efront" {
  accessibility_self_service  = "false"
  app_links_json              = "{\"efront_link\":true}"
  app_settings_json           = "{\"audienceURI\":\"${var.audienceURI}\",\"domain\":\"https://${var.audienceURI}\"}"
  assertion_signed            = "false"
  auto_submit_toolbar         = "false"
  hide_ios                    = "false"
  hide_web                    = "false"
  honor_force_authn           = "false"
  implicit_assignment         = "false"
  label                       = "eFront"
  preconfigured_app           = "efront"
  response_signed             = "false"
  saml_signed_request_enabled = "false"
  saml_version                = "2.0"
  status                      = "ACTIVE"
  user_name_template          = "$${source.email}"
  user_name_template_type     = "BUILT_IN"
}

# Group Creation
resource "okta_group" "efront-users" {
  name        = "eFront_Users"
  description = "Assign eFront Users"
}

# Group Assignments
resource "okta_app_group_assignment" "efront-users" {
  app_id   = okta_app_saml.efront.id
  group_id = okta_group.efront-users.id
}