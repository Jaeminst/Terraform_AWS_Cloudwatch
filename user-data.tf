data "template_file" "client" {
  template = file("./user-data.sh")
}
data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = true
  #first part of local config file
  part {
    content_type = "text/x-shellscript"
    content      = <<-EOF
    #!/bin/bash
    echo 'server_port="${var.server_port}"' >> /opt/env_server_port
    EOF
  }
  #second part
  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.client.rendered
  }
}