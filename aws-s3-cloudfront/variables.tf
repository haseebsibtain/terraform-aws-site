variable "aws_region" {
  description = "Region for the S3 origin bucket. CloudFront is global."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix for resource names. Lowercase, hyphenated."
  type        = string
  default     = "hsg-resume-site"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,40}$", var.project_name))
    error_message = "project_name must be lowercase alphanumeric/hyphens, 3-40 chars (S3 naming rules)."
  }
}

variable "price_class" {
  description = <<-EOT
    CloudFront price class. PriceClass_100 = North America + Europe PoPs only.
    Cheapest tier; a resume site does not need Sydney edge nodes.
  EOT
  type        = string
  default     = "PriceClass_100"
}

variable "site_files" {
  description = "Map of site files to upload: key = S3 object key, value = local path."
  type        = map(string)
  default = {
    "index.html" = "site/index.html"
  }
}
variable "domain_name" {
  description = "Apex domain for the site"
  type        = string
  default     = "haseebsibtain.com"
}