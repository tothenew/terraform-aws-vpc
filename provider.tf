provider "aws" {
    region      = var.region
    default_tags {
        tags = merge(
            var.common_tags,
            tomap({
                "Project"     = var.Project,
                "Environment" = var.Environment
            })
        )
    }
}
