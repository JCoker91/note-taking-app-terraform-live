provider "aws" {
    region = "us-west-2"
}

module "frontend_cluster" {
    # Will use git repo for module and control through versioning
    source = "github.com/JCoker91/note-taking-app-terraform-modules.git//services/frontend?ref=v0.0.2"
    

    cluster_name = "frontend-stage"
    remote_state_bucket = "nta-terraform-state"
    remote_state_key = "stage/data-stores/postgres/terraform.tfstate"
    region = "us-west-2"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 2
}