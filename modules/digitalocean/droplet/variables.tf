variable "prefix" {
  description = "Specifies the prefix added to the names of all resources. Default is 'do-tf'."
  type        = string
  default     = "do-tf"
}

variable "os_image_id" {
  description = "Specifies the custom OpenSUSE image uploaded to the DigitalOcean account. Default is 'null'."
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the DigitalOcean region used for all resources. Default is 'fra1'."
  type        = string
  default     = "fra1"
  validation {
    condition = contains([
      "nyc1",
      "nyc2",
      "nyc3",
      "ams3",
      "sfo2",
      "sfo3",
      "sgp1",
      "lon1",
      "fra1",
      "tor1",
      "blr1",
      "syd1"
    ], var.region)
    error_message = "Invalid Region specified."
  }
}

variable "create_ssh_key_pair" {
  description = "Specifies whether a new SSH key pair needs to be created for the instances. Default is 'true'."
  type        = bool
  default     = true
}

variable "ssh_private_key_path" {
  description = "Specifies the full path where the pre-generated SSH PRIVATE key is located (not generated by Terraform). Default is 'null'."
  type        = string
  default     = null
}

variable "ssh_public_key_path" {
  description = "Specifies the full path where the pre-generated SSH PUBLIC key is located (not generated by Terraform). Default is 'null'."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Specifies the name of the DigitalOcean Droplet type. Default is 'g-16vcpu-64gb'."
  type        = string
  default     = "g-16vcpu-64gb"
}

variable "data_disk_count" {
  description = "Specifies the number of additional data disks to create (1 or 3). Default is '1'."
  type        = number
  default     = 1
  validation {
    condition     = contains([1, 3], var.data_disk_count)
    error_message = "The number of data disks must be 1 or 3."
  }
}

variable "data_disk_size" {
  description = "Specifies the size of each additional data disk attached to the Droplet, in GB. Default is '350'."
  type        = number
  default     = 350
}

variable "startup_script" {
  description = "Specifies a custom startup script to run when the Droplets start. Default is 'null'."
  type        = string
  default     = null
}
