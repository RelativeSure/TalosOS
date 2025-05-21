terraform {
  cloud {

    organization = "RelativeSure"

    workspaces {
      name = "TalosOS"
    }
  }
}
