# Enterprise AWS Full-Stack Architecture Terraform Templates

https://blairyfairy.github.io/BlairPage/blog.html

Production-ready Terraform configurations for deploying high-availability, scalable e-commerce platforms (WooCommerce & Magento 2) on AWS, featuring Multi-AZ RDS MySQL, Dual ElastiCache Redis (separating cache and persistent cart sessions), Amazon OpenSearch, Application Load Balancers, and CloudFront CDN.

## Architecture Highlights
- **VPC & Networking**: Multi-AZ architecture across Public, Private, and Database subnets with Internet & NAT Gateways.
- **Compute Layer**: Auto Scaling EC2 instances behind an Application Load Balancer.
- **Database Layer**: Amazon RDS MySQL Multi-AZ with automated backups and encrypted storage.
- **Caching Layer (Dual Redis)**: 
  - Redis Cluster 0/1 for Object and Full-Page Cache.
  - Redis Cluster 2 (port 6380) dedicated to Session & Persistent Cart Storage.
- **Search Layer**: Amazon OpenSearch cluster for high-performance catalog indexing and filtering.
- **CDN**: CloudFront distribution for edge caching and static asset acceleration.

## Quick Start
1. Configure your AWS credentials (`aws configure`).
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Review and adjust variables in `variables.tf` or provide a `terraform.tfvars` file.
4. Apply the configuration:
   ```bash
   terraform apply
   ```
