sudo apt update && sudo apt upgrade -y
sudo apt install git curl wget vim net-tools lvm2 python3-pip docker.io -y
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
cd UTN-FRA_SO_Examenes/202406
chmod +x script_Precondicion.sh
./script_Precondicion.sh
source ~/.bashrc
cd ~
mkdir 202406 RTA_Examen_20250710
202406
cd 202406
touch 202406_2doParcial.pdf
mkdir _checks ansible bash_script docker
cp ~/UTN-FRA_SO_Examenes/202406/script_Precondicion.sh .
sudo fdisk /dev/sdb
mkdir -p ~/discos_tp
cd ~/discos_tp
dd if=/dev/zero of=disk_datos.img bs=1M count=2048
dd if=/dev/zero of=disk_temp.img bs=1M count=1024
sudo losetup -fP disk_datos.img
sudo losetup -fP disk_temp.img
/dev/loop2: [2065]: (/home/mariano/discos_tp/disk_datos.img)
/dev/loop3: [2065]: (/home/mariano/discos_tp/disk_temp.img)
losetup -a
cd ~/RTA_Examen_20250710
nano Punto_A.sh
cd ~/202406/bash_script
nano Lista_Usuarios.txt
sudo nano /usr/local/bin/SoteloAltaUser-Groups.sh
sudo chmod +x /usr/local/bin/SoteloAltaUser-Groups.sh
/usr/local/bin/SoteloAltaUser-Groups.sh mariano ~/202406/bash_script/Lista_Usuarios.txt
cp /usr/local/bin/SoteloAltaUser-Groups.sh ~/RTA_Examen_20250710/
ls -l ~/RTA_Examen_20250710/
cd ~/202406/docker
nano index.html
nano Dockerfile
docker build -t web1-sotelo .
sudo usermod -aG docker mariano
exit
cd ~/202406/docker
docker build -t web1-sotelo .
docker tag web1-sotelo marianoou207/web1-sotelo
docker login
docker push marianoou207/web1-sotelo
cd ~/202406/docker
nano run.sh
cd ~/202406/docker
nano run.sh
chmod +x run.sh
./run.sh
cp run.sh ~/RTA_Examen_20250710/Punto_C.sh
cd ~/202406/ansible
ansible-galaxy init roles/sotelo_role
sudo apt update
sudo apt install ansible -y
cd ~/202406/ansible
ansible-galaxy init roles/sotelo_role
mkdir -p roles/sotelo_role/templates
nano roles/sotelo_role/templates/datos_alumno.txt.j2
nano roles/sotelo_role/templates/datos_equipo.txt.j2
nano roles/sotelo_role/tasks/main.yml
nano playbook.yml
nano ~/RTA_Examen_20250710/Punto_D.sh
chmod +x ~/RTA_Examen_20250710/Punto_D.sh
~/RTA_Examen_20250710/Punto_D.sh
nano ~/202406/ansible/roles/sotelo_role/tasks/main.yml
~/RTA_Examen_20250710/Punto_D.sh
history -a
cd ~
git clone https://github.com/marianoou207/UTNFRA_SO_2do_TP_Sotelo_Limont.git
cd ~/UTNFRA_SO_2do_TP_Sotelo_Limont
cp -r ~/202406 .
cp -r ~/RTA_Examen_20250711 .
cp ~/.bash_history .
tree -L 2
sudo apt install tree
tree -L 2
cd ~/UTNFRA_SO_2do_TP_Sotelo_Limont
cp -r ~/202406 .
cp -r ~/RTA_Examen_20250711 .
cp ~/.bash_history .
tree -L 2
cp -r ~/RTA_Examen_20250711 ~/UTNFRA_SO_2do_TP_Sotelo_Limont/
ls ~
cp -r ~/RTA_Examen_20250710 ~/UTNFRA_SO_2do_TP_Sotelo_Limont/
