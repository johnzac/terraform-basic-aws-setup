resource "aws_elasticache_cluster" "memcached-cluster" 
{
  cluster_id           = "demoapp-cluster"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  port                 = 11211
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.4"
  subnet_group_name = "${aws_elasticache_subnet_group.memcache_subnet.name}"
  security_group_ids = ["${aws_security_group.memcache.id}"]

}
