resource "yandex_kubernetes_cluster" "k8s-cluster" {
  name = "k8s-cluster"
  service_account_id = var.service_sa
  node_service_account_id = var.service_sa
  network_id = yandex_vpc_network.main.id
  master {
    master_location {
      zone      = var.default_zone_1
      subnet_id = yandex_vpc_subnet.one.id
    }
    master_location {
      zone      = var.default_zone_2
      subnet_id = yandex_vpc_subnet.two.id
    }
    master_location {
      zone      = var.default_zone_3
      subnet_id = yandex_vpc_subnet.three.id
    }
    security_group_ids = [
      yandex_vpc_security_group.k8s-cluster-nodegroup-traffic.id,
      yandex_vpc_security_group.k8s-cluster-traffic.id
    ]
    public_ip = true
  }
}

resource "yandex_kubernetes_node_group" "worker-nodes-a" {
  cluster_id = yandex_kubernetes_cluster.k8s-cluster.id
  name       = "worker-nodes-a"
  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }
  scale_policy {
    fixed_scale {
      size = 1
    }
  }
  instance_template {
    network_interface {
      nat                = true
      subnet_ids         = [yandex_vpc_subnet.one.id]
      security_group_ids = [
        yandex_vpc_security_group.k8s-cluster-nodegroup-traffic.id,
        yandex_vpc_security_group.k8s-nodegroup-traffic.id,
        yandex_vpc_security_group.k8s-services-access.id,
        yandex_vpc_security_group.k8s-ssh-access.id
      ]
    }
  }
}
