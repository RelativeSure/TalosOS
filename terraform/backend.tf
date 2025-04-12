terraform { 
  cloud { 
    
    hostname = "app.terraform.io"
    organization = "RelativeSure" 

    workspaces { 
      name = "init-talosos" 
    } 
  } 
}
