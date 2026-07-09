#!/bin/bash

cat << 'EOF' > show-info.sh
#!/bin/bash

cat -e << INFO
The current directory is: $PWD
The default paths are: $PATH
The current user is: $USERNAME
INFO
EOF

chmod +x show-info.sh