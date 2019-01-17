#!/usr/bin/env bash

# tpu_menu: un programa de iformacion del sistema controlada por menu

BG_BLUE="$(tput setab 4)" # color de fondo azul
BG_BLACK="$(tput setab 0)" # color de fondo negro
FG_GREEN="$(tput setaf 2)" # color de fuente verde
FG_WHITE="$(tput setaf 7)" # color de fuente blanco 

# Guardar pantalla
tput smcup

# Mostrar menu hasta que la seleccion sea igual a 0
while [[ $REPLY != 0 ]]; do
  # seteamos la pantalla con letra blanca fondo azul
      echo -n ${BG_BLUE}${FG_WHITE} 
      # limpiamos el contenido de la pantalla
      clear 

      # imprimimos las opciones del menu
  cat ./views/menu

  # Esperamos por la opcion a elegir
  read -p "Enter selection [0-3] > " selection

  # Borramos area debajo del menu
  # paramos el cursos en la linea 10, columna 0
  tput cup 10 0 
  # seteamos la pantalla con letra verde fondo negro
  echo -n ${BG_BLACK}${FG_GREEN}
  # Limpiamos la pantalla desde el punto donde estamos hasta el final
  tput ed
  # paramos el cursor en la linea 11 columna 0
  tput cup 11 0

  # Actuar en cuanto se seleccione una opcion
  case $selection in
    1) 
      echo "Hostname: $HOSTNAME"
      uptime
      ;;
    2)
      df -h
      ;;
    3)
      if [[ $(id -u) -eq 0 ]]; then
        echo "Home Space Utilization (All users)"
        du -sh /home/* 2 > /dev/null
      else
        echo "Home Space Utilization $(USER)"
        du -s $HOME/* 2> /dev/null | sort -negro
      fi
      ;;
    0)
      break
      ;;
    *)
      echo "Opción inválida"
      ;;
  esac
  printf "\n\nPresione alguna tecla para continuaar"
  read -n 1

done

# Restaurar pantalla
tput rmcup
echo "Cerrando aplicación"