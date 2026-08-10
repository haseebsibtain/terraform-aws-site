output "cloudfront_url" {
  description = "The public URL of the site — the only public path to the content."
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "Needed for cache invalidations on deploy: aws cloudfront create-invalidation --distribution-id <id> --paths '/index.html'"
  value       = aws_cloudfront_distribution.site.id
}

output "origin_bucket" {
  description = "Origin bucket name. Direct access should fail — verify with: curl -sI https://<bucket>.s3.amazonaws.com/index.html (expect 403)."
  value       = aws_s3_bucket.site.id
}
