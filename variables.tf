variable "project_id" {
  type    = string
  default = "tabajara-316317"
}

variable "regiao" {
  type    = string
  default = "us-east1"
}

variable "nome" {
  type    = string
  default = "vm-webserver"
}
variable "tipo_maquina" {
  type    = string
  default = "f1-micro"
}
variable "zona" {
  type    = string
  default = "us-east1-b"

}

variable "imagem" {
  type    = string
  default = "debian-cloud/debian-9"
}