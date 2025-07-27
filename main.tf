

provider "null" {}

resource "null_resource" "create_dirs_and_files" {
  provisioner "local-exec" {
    command = <<TEJ
      mkdir -p ./abc/dir1 ./abc/dir2
      touch ./abc/dir1/file1.txt
      touch ./abc/dir2/file2.txt
    TEJ
  }
}
