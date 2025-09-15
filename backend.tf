terraform {
  backend "http" {
      address          = "https://gitlab.com/api/v4/projects/{gitlab-project-id}/terraform/state/{repo-name}"
      lock_address     = "https://gitlab.com/api/v4/projects/{gitlab-project-id}//terraform/state/{repo-name}/lock"
      unlock_address   = "https://gitlab.com/api/v4/projects/{gitlab-project-id}//terraform/state/{repo-name}/lock"
      username         =  "tf" 
      lock_method      = "POST"
      unlock_method    = "DELETE"
      retry_wait_min   = 5
  }
}
