# Esegui il comando e salva l'output in una variabile
output=$(qm list | grep -v VMID | awk -F " " '{print $1}')

# Dichiara un array in Bash
declare -a my_array

# Itera attraverso l'output e assegna ogni elemento all'array
for item in $output
do
  my_array+=("$item")
done

# Ora l'array "my_array" contiene gli elementi desiderati
# Puoi accedere agli elementi dell'array in questo modo:
echo "Elementi dell'array:"
for item in "${my_array[@]}"
do
  qm shutdown $item
done