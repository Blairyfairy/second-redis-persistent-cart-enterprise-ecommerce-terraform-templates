output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The VPC ID"
}

output "alb_dns_name" {
  value       = aws_lb.app.dns_name
  description = "Application Load Balancer DNS endpoint"
}

output "rds_endpoint" {
  value       = aws_db_instance.mysql.endpoint
  description = "MySQL database endpoint"
}

output "redis_cache_endpoint" {
  value       = aws_elasticache_cluster.cache_redis.cache_nodes[0].address
  description = "Redis Cache endpoint (Port 6379)"
}

output "redis_session_endpoint" {
  value       = aws_elasticache_cluster.session_redis.cache_nodes[0].address
  description = "Redis Session endpoint (Port 6380)"
}

output "opensearch_endpoint" {
  value       = aws_opensearch_domain.search.endpoint
  description = "Amazon OpenSearch domain endpoint"
}
