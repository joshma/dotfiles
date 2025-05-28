Este repositorio almacena archivos de configuración personales (dotfiles) para diversas herramientas de línea de comandos y desarrollo. Su objetivo es proporcionar un entorno consistente y personalizado en diferentes sistemas.

## Instalación

1.  **Clona el repositorio (si aún no lo has hecho):**
    Si estás viendo este README en GitHub o en otro lugar, primero necesitarás clonar el repositorio.
    ```bash
    git clone <repository_url> ~/dotfiles 
    # Reemplaza <repository_url> con la URL real
    cd ~/dotfiles
    ```
    Si ya lo has clonado y estás en el directorio, procede al siguiente paso.

2.  **Ejecuta el script de instalación:**
    Asegúrate de estar en el directorio raíz de este repositorio clonado.
    ```bash
    ./install.sh
    ```

Este script:
*   Instalará `diff-so-fancy` (una herramienta para diffs más bonitos).
*   Hará una copia de seguridad de cualquier dotfile existente si existe (por ejemplo, `~/.vimrc` se respaldaría en `~/.vimrc.bak`).
*   Creará enlaces simbólicos desde tu directorio personal a los archivos de configuración en este repositorio para las siguientes herramientas:
    *   Vim (`~/.vimrc`, `~/.vim/`)
    *   Git (`~/.gitconfig`)
    *   Zsh (`~/.zshrc`)
    *   Tmux (`~/.tmux.conf`)

Asegúrate de reemplazar `https://your-repository-url/dotfiles.git` con la URL real de este repositorio en las instrucciones.

## Características Clave y Herramientas Configuradas

Estas configuraciones están diseñadas para crear una experiencia de línea de comandos cómoda y eficiente. `diff-so-fancy` está integrado en todas las herramientas para mejorar la legibilidad de los diffs.

**Vim (`~/.vimrc`, `~/.vim/`)**

*   **Gestión de Plugins:** Usa `pathogen.vim` para gestionar plugins.
*   **Personalizaciones:**
    *   **Indentación:** Por defecto, 4 espacios. Los archivos web (HTML, CSS, JavaScript, etc.) usan 2 espacios.
    *   **Esquema de Colores:** Esquema de colores "Mustang" con soporte para 256 colores.
    *   **Navegación:** Numerosos atajos de teclado para una fácil navegación entre pestañas y ventanas.
    *   **Interruptores:** Interruptores convenientes para funciones como revisión ortográfica, números de línea y modo de pegado.
    *   **Compatible con Powerline:** La configuración está optimizada para su uso con Powerline o plugins de línea de estado similares.
    *   **Resaltado de Sintaxis:** La sintaxis HTML está configurada como `htmljinja` para un mejor soporte de plantillas.

**Git (`~/.gitconfig`)**

*   **Diffs y Logs:** Integra `diff-so-fancy` para salidas más claras de `git diff` y `git log`.
*   **Aliases:**
    *   `lg`: Log detallado y con gráfico.
    *   `st`: Estado corto.
    *   `co`: Checkout.
    *   `ci`: Commit.
    *   `br`: Branch.
*   **Git LFS:** Preconfigurado para Git Large File Storage.
*   **Estrategia de Fusión (Merge):** Establece `pull.ff = only` para asegurar que las fusiones sean solo fast-forward, manteniendo un historial lineal.
*   **Configuración de Usuario:** **Importante:** Necesitarás actualizar tu nombre y correo electrónico en `~/.gitconfig` después de la instalación.
    ```
    [user]
        name = Your Name
        email = your.email@example.com
    ```
*   **Opcional (macOS):** Incluye configuraciones comentadas para usar Kaleidoscope como herramienta de diff.

**Zsh (`~/.zshrc`)**

*   **Framework:** Potenciado por Oh My Zsh.
*   **Tema:** Usa el tema "af-magic".
*   **Editor por Defecto:** Establece `EDITOR` en Vim.
*   **Integración con iTerm2:** Incluye configuraciones para una integración mejorada con iTerm2 (si está disponible).
*   **Listo para Herramientas:**
    *   Preparado para NVM (Node Version Manager).
    *   Preparado para fzf (buscador difuso).
*   **Plugins:** Utiliza el plugin 'git' de Oh My Zsh para operaciones de git mejoradas.

**Tmux (`~/.tmux.conf`)**

*   **Shell por Defecto:** Establece Zsh como el shell por defecto para nuevas sesiones de tmux.

## Prerrequisitos

Antes de ejecutar el script `install.sh`, asegúrate de tener instalado el siguiente software:

*   `git`: Para clonar el repositorio y para la configuración de Git en sí. También es utilizado por el script para clonar `diff-so-fancy`.
*   `zsh`: El shell Zsh es utilizado y configurado. Probablemente querrás establecerlo como tu shell por defecto.
*   `vim`: Vim es el editor principal configurado.
*   `tmux`: Tmux está configurado para la multiplexación de terminales.
*   `sudo`: El script `install.sh` utiliza `sudo` para instalar `diff-so-fancy` en `/usr/local/bin`.

## Contribuciones

¡Las sugerencias y contribuciones son bienvenidas! Siéntete libre de abrir un issue para discutir un cambio o enviar un pull request.
