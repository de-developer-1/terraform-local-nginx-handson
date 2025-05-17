resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "nginx_web"
  image = docker_image.nginx.latest

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "${path.module}/../docker/nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
  }

  volumes {
    host_path      = "${path.module}/../docker/html"
    container_path = "/usr/share/nginx/html"
  }
}

resource "docker_image" "redis" {
  name = "redis:latest"
}

resource "docker_container" "redis" {
  name  = "redis_server"
  image = docker_image.redis.latest

  ports {
    internal = 6379
    external = 6379
  }
}
