# Diccionario para guardar los usuarios
usuarios = {}

# Menú principal
while True:
    print("\nMENU PRINCIPAL")
    print("1.- Ingresar usuario.")
    print("2.- Buscar usuario.")
    print("3.- Eliminar usuario.")
    print("4.- Salir.")
    
    opcion = input("\nIngrese opción:\n")

    # Opción 1: Ingresar usuario
    if opcion == "1":
        nombre = input("\nIngrese nombre de usuario:\n")
        if nombre in usuarios:
            print("\nUsuario ya existe. Intente otro.")
            continue

        sexo = input("\nIngrese sexo (M o F):\n")
        if sexo.upper() != "M" and sexo.upper() != "F":
            print("\nDebe ingresar M o F solamente.")
            continue

        contrasena = input("\nIngrese contraseña:\n")

        if len(contrasena) < 8:
            print("\nContraseña muy corta. Debe tener al menos 8 caracteres.")
            continue
        if " " in contrasena:
            print("\nLa contraseña no debe tener espacios.")
            continue
        tiene_letra = False
        tiene_numero = False
        for c in contrasena:
            if c.isalpha():
                tiene_letra = True
            if c.isdigit():
                tiene_numero = True
        if not tiene_letra or not tiene_numero:
            print("\nLa contraseña debe tener al menos una letra y un número.")
            continue

        print("\nContraseña válida.")
        usuarios[nombre] = {"sexo": sexo.upper(), "contrasena": contrasena}
        print("\nUsuario ingresado con éxito!!")

    # Opción 2: Buscar usuario
    elif opcion == "2":
        buscar = input("\nIngrese usuario a buscar:\n")
        if buscar in usuarios:
            print("\nEl sexo del usuario es:", usuarios[buscar]["sexo"], 
                  "y la contraseña es:", usuarios[buscar]["contrasena"])
        else:
            print("\nUsuario no se encuentra.")

    # Opción 3: Eliminar usuario
    elif opcion == "3":
        eliminar = input("\nIngrese el nombre de usuario a eliminar:\n")
        if eliminar in usuarios:
            del usuarios[eliminar]
            print("\nUsuario eliminado!")
        else:
            print("\nNo se pudo eliminar usuario!")

    # Opción 4: Salir
    elif opcion == "4":
        print("\nSaliendo del programa...")
        break

    # Opción inválida
    else:
        print("\nDebe seleccionar una opción válida.")