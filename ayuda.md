Preguntas

      # echo '¿Desea continuar? [s/n]'
      # read -r response
      # if [[ "$response" =~ ^[nN]$ ]]; then
      #   echo "n" or "N"
      # fi

---

merge with theirs
git merge --strategy-option=theirs'

---

Preguntas

      #     echo "[s/n]"
      #     read -r confirm
      #     if [[ $confirm == [sS] ]]; then
      #         echo "s" or "S"
      #     else
      #         echo "letter different of s"
      #     fi
      # }

---

# Usando -n

if [ -n "$variable" ]; then
echo "La variable no está vacía"
else
echo "La variable está vacía"
fi

---

# Usando -z

if [ -z "$variable" ]; then
echo "La variable está vacía"
else
echo "La variable no está vacía"
fi

---

Sí, existen otras opciones que se pueden usar junto con [ o test en Bash. Algunas de ellas son:

-eq: Compara si dos números son iguales.
-ne: Compara si dos números son diferentes.
-lt: Compara si un número es menor que otro.
-le: Compara si un número es menor o igual que otro.
-gt: Compara si un número es mayor que otro.
-ge: Compara si un número es mayor o igual que otro.
-f: Verifica si un archivo existe y es regular (no un directorio).
-d: Verifica si un archivo existe y es un directorio.
-r: Verifica si un archivo existe y es legible por el usuario.
-w: Verifica si un archivo existe y es escribible por el usuario.
-x: Verifica si un archivo existe y es ejecutable por el usuario.

---
