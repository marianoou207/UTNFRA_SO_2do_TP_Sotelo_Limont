#!/bin/bash
# TP2 - Punto A
# Alumno: Mariano Nicolas Sotelo Limont - Div 117
# VM: Multipass con discos simulados (losetup)

# -----------------------------
# Asignación de dispositivos:
# /dev/loop0 -> disk_datos.img (2GB)
# /dev/loop1 -> disk_temp.img  (1GB)
# -----------------------------

echo "creando volúmenes físicos..."
sudo pvcreate /dev/loop0 /dev/loop1

echo "creando grupos de volúmenes..."
sudo vgcreate vg_datos /dev/loop0
sudo vgcreate vg_temp /dev/loop1

echo "creando volúmenes lógicos..."
sudo lvcreate -L 5M -n lv_docker vg_datos
sudo lvcreate -L 1.5G -n lv_workareas vg_datos
sudo lvcreate -L 512M -n lv_swap vg_temp

echo "formateando volúmenes..."
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mkswap /dev/vg_temp/lv_swap

echo "creando puntos de montaje y montando..."
sudo mkdir -p /var/lib/docker /work
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workareas /work
sudo swapon /dev/vg_temp/lv_swap

echo "configurando persistencia en /etc/fstab..."
echo "/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/vg_datos/lv_workareas /work ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/vg_temp/lv_swap none swap sw 0 0" | sudo tee -a /etc/fstab

echo "estado final:"
df -hT | grep -E 'docker|work'
swapon --show
sudo vgdisplay
sudo lvdisplay

echo "p[unto A realizado."
