resource "aws_cloudfront_distribution" "cf_demoapp" 
{
    enabled = true
    origin 
{
        domain_name = "${aws_s3_bucket.demoApp_bucket.bucket_domain_name}"
        origin_id = "demoapporigin"
}

    default_cache_behavior 
{
        allowed_methods = ["HEAD", "GET", "OPTIONS"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = "demoapporigin"
        forwarded_values {
            headers = ["Origin"]
            query_string = false

      cookies {
        forward = "none"
      }
        }

        viewer_protocol_policy = "allow-all"
        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400
    }

    price_class = "PriceClass_All"

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}
