terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  cloud {
    organization = "Terraform-Bootcamp2023"
    workspaces {
      name = "terra-house-1"
    }
  }
  
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}


module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home" {
  name = "How to play God of War in 2023!!!"
  description = <<DESCRIPTION
"God of War" is a highly acclaimed action-adventure video game series 
created by David Jaffe and developed by Santa Monica Studio, initially 
released in 2005 on the PlayStation 2. Centered around the Spartan warrior Kratos, 
the narrative unfolds in the backdrop of Greek mythology, featuring intense combat, 
iconic weapons like the Blades of Chaos, and a gripping storyline of revenge 
against the gods. The series, known for its visceral gameplay and cinematic storytelling, 
has evolved, with the 2018 installment shifting Kratos to Norse mythology. 
Renowned for its stunning visuals and impactful narrative, "God of War" has 
become a flagship title on the PlayStation platform, influencing the gaming 
industry in both storytelling and gameplay mechanics.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  town = "gamers-grotto"
  content_version = var.arcanum.content_version
}

# module "home_payday_hosting" {
#   source = "./modules/terrahome_aws"
#   user_uuid = var.teacherseat_user_uuid
#   public_path = var.payday.public_path
#   content_version = var.payday.content_version
# }

# resource "terratowns_home" "home_payday" {
#   name = "Making your Payday Bar"
#   description = <<DESCRIPTION
# Since I really like Payday candy bars but they cost so much to import
# into Canada, I decided I would see how I could my own Paydays bars,
# and if they are most cost effective.
# DESCRIPTION
#   domain_name = module.home_payday_hosting.domain_name
#   town = "missingo"
#   content_version = var.payday.content_version
# }

