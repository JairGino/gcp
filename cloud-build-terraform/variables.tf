variable "network_name" {
  description = "Nome da Rede"
  type        = string
  default     = "terraform-network"
}

variable "centro_custo_rh" {
  description = "Nome da Rede"
  type        = string
  default     = "rh"
}

variable "bucket_name" {
  description = "Nome do Bucket"
  type        = string
  default     = "bucketName"
}

variable "project_id" {
  description = "ID do projeto"
  type        = string
  default     = "projectID"
}

variable "remote_repository" {
  description = "ID do projeto"
  type        = string
  default     = "https://github.com/JairGino/REPO.git"
}

variable "filename_path" {
  description = "ID do projeto"
  type        = string
  default     = ".cloudbuild.yaml"
}