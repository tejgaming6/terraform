provider "null" {}

resource "null_resource" "create_dirs_and_files" {
  provisioner "local-exec" {
    command = <<TEJ
      mkdir -p "${var.dir[0]}" "${var.dir[1]}"
      touch "${var.file[0]}"
      touch "${var.file[1]}"
    TEJ
  }
}
