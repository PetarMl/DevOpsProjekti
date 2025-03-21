 terraform-apache-project

├──  terraform

│ ├── main.tf

│ ├── output.tf

│ ├── variables.tf

│ ├── terraform.tfstate 

│


├──  ansible

│ ├── inventory.ini 

│ ├── apache-playbook.yml 

│

├── index.html 

├── style.css 

|___ README.md

Tehnologije koriscene u projektu: AWS,Terraform, Ansible i Git(postavljen projekat preko komandi, ne manuleno)

Uputstva za koriscenje:
1. Pravljenje EC2 virtuelne masine preko Terraforma:
 - cd terraform
 - terraform init
 - terraform plan (provera za svaki slucaj da nema gresaka)
 - terraform apply -auto-approve

 2. Izvrsavanje Ansible playbook-a za instaliranje Apache-a na EC2 VM:
  - cd ../ansible
  - ansible-playbook -i ansible/inventory.ini ansible/apache-playbook.yml (promeniti Public IP pre nego sto se pokrene projekat, svaki put kad se napravi VM menja se i IP)
  - http:3.83.111.80 (u mom slucaju) pristup Statickom Web sajtu hostovanom na Apache-u

  3. Unistavamo EC2 kada zavrsimo :
   - terraform destroy -auto-approve

 
