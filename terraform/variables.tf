variable "ami"{
    type=string
    default="ami-08b5b3a93ed654d19"
    description = "ami za EC2 instancu"
}
variable "all_traffic"{
    type=string
    default = "0.0.0.0/0"
}