output "name" {
  description = "Name required for tests"
  value       = element(split(":", module.this.values.arn), 6)
}