resource "aws_route53_zone" "demoapp" 
{
  name = "demoapp.com"
  vpc_id = "${aws_vpc.demoAppVpc.id}"
}



resource "aws_route53_record" "memcached" 
{
  zone_id = "${aws_route53_zone.demoapp.zone_id}"
  name    = "memcached.${aws_route53_zone.demoapp.name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_elasticache_cluster.memcached-cluster.cluster_address}"]
}

resource "aws_route53_record" "mysql"
{
  zone_id = "${aws_route53_zone.demoapp.zone_id}"
  name    = "mysql.${aws_route53_zone.demoapp.name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_db_instance.demoAppMysql.address}"]
}

resource "aws_route53_record" "s3"
{
  zone_id = "${aws_route53_zone.demoapp.zone_id}"
  name    = "s3.${aws_route53_zone.demoapp.name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_s3_bucket.demoApp_bucket.bucket_domain_name}"]
}

