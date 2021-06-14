#Configurando o projeto GCP
provider "google" {
  credentials = file("/home/romulo/projetos/terraform-gcp/tabajara-316317-869834c2e96d.json")
  project     = var.project_id
  region      = var.regiao
}

resource "google_compute_network" "vpc_terraform" {
  name = "vpc-terraform"
}
#Criando a VM com o Google Compute Engine
resource "google_compute_instance" "webserver" {
  name         = var.nome
  machine_type = var.tipo_maquina
  zone         = var.zona

  boot_disk {
    initialize_params {
      image = var.imagem
    }
  }
  # Instala o servidor Web Apache
  metadata_startup_script = "sudo apt-get update;sudo apt-get install apache2 -y;echo Testando > /var/www/html/index.html"

  #Habilita rede para a VM bem como um IP publico
  network_interface {
    network = "default"
    access_config {

    }
  }

}
# Cria o Firewall para a VM
resource "google_compute_firewall" "webfirewall" {
  name        = "${var.nome_fw}"
  network     = "default"

  allow {
    protocol  = "tcp"
    ports     = "${var.portas}"
  }
}
