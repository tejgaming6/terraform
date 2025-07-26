resource "null_resource" "create_dirs_and_files" {
  provisioner "local-exec" {
    command = <<EOT
      mkdir -p ./output/dir1 ./output/dir2
      touch ./output/dir1/file1.txt
      touch ./output/dir2/file2.txt
    EOT
  }
}

