provider "aws" {
    region      = var.region
    profile     = var.profile
    default_tags {
        tags = merge(
            var.common_tags,
            tomap({
                "Project"     = var.project,
                "Environment" = var.environment
            })
        )
    }
}
