function random_messages () {
  # Lista de mensajes motivadores.
  mensajes=(
    "Eres más fuerte de lo que piensas."
    "Confía en ti mismo y sigue adelante."
    "Nunca es demasiado tarde para empezar de nuevo."
    "Cada día es una nueva oportunidad para ser feliz."
    "Siempre hay algo que agradecer en la vida."
    "El fracaso es una oportunidad para crecer y aprender."
    "Tú eres el arquitecto de tu propio destino."
    "Tienes el poder de cambiar tu vida en cualquier momento."
    "La felicidad no es un destino, es un camino."
    "Tú eres capaz de lograr todo lo que te propongas."
    "Siempre hay una razón para sonreír."
    "Cada pequeño paso te acerca a tu objetivo."
    "Mantén una actitud positiva y el éxito llegará."
    "No te rindas, cada fracaso es una oportunidad para mejorar."
    "Eres capaz de superar cualquier obstáculo."
  )

  # Imprime cinco mensajes motivadores.
  for i in {1..5}; do
    # Selecciona un mensaje al azar de la lista y lo imprime en la consola.
    mensaje=${mensajes[$RANDOM % ${#mensajes[@]}]}
    echo "$mensaje"
    sleep 1
  done
}

# Define la función 'mensajes_motivacionales'.
function mensajes_motivacionales {
  random_messages

  # Pregunta si se desea continuar mostrando mensajes motivadores.
  echo "¿Deseas continuar viendo mensajes motivadores? (s/n) "

  # Lee la respuesta con un tiempo de espera de 7 segundos.
  if read -t 7 respuesta; then
    if [[ "$respuesta" =~ ^[sS]$ ]]; then
      # Si la respuesta es sí, sigue mostrando mensajes hasta llegar al límite de 10 veces.
      if [ "$contador" -lt 10 ]; then
        contador=$((contador+1))
        mensajes_motivacionales
      else
        echo "¡Felicidades, has visto 10 mensajes motivadores hoy! ¡Que tengas un gran día!"
      fi
    fi
  else
    echo "¡Que tengas un gran día!"
  fi
}

# Define el alias 'mensajes-motivacionales' para la función 'mensajes_motivacionales'.
alias mensajes-motivacionales='contador=0; mensajes_motivacionales'
alias mm='contador=0; mensajes_motivacionales'
