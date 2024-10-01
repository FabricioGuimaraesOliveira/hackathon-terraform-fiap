provider "aws" {
  region = "us-east-1"
}

# Repositório ECR para hackathon-ms-doctor-service
resource "aws_ecr_repository" "hackathon_ms_doctor_service" {
  name                 = "hackathon-ms-doctor-service"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Repositório ECR para hackathon-ms-appointment-service
resource "aws_ecr_repository" "hackathon_ms_appointment_service" {
  name                 = "hackathon-ms-appointment-service"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Repositório ECR para hackathon-ms-patient-service
resource "aws_ecr_repository" "hackathon_ms_patient_service" {
  name                 = "hackathon-ms-patient-service"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Output para exibir as URLs dos repositórios ECR

output "hackathon_ms_doctor_service_repository_url" {
  value = aws_ecr_repository.hackathon_ms_doctor_service.repository_url
}

output "hackathon_ms_appointment_service_repository_url" {
  value = aws_ecr_repository.hackathon_ms_appointment_service.repository_url
}

output "hackathon_ms_patient_service_repository_url" {
  value = aws_ecr_repository.hackathon_ms_patient_service.repository_url
}
