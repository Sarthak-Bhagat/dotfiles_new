#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

cd ~/.config/systemd

for item in *; do
    if [[ -d "$item" ]]; then
        echo -e "${BLUE}Processing directory: $item${NC}"
        
        case "$item" in
            user)
                target_dir="/etc/systemd/user"
                systemctl_cmd="systemctl --user"
                ;;
            system)
                target_dir="/etc/systemd/system"
                systemctl_cmd="sudo systemctl"
                ;;
            *)
                echo -e "${YELLOW}Skipping unknown directory: $item${NC}"
                continue
                ;;
        esac
        
        if [[ ! -d "$target_dir" ]]; then
            sudo mkdir -p "$target_dir"
            echo -e "${GREEN}Created directory: $target_dir${NC}"
        fi
        
        for file in "$item"/*; do
            if [[ -f "$file" && "$file" == *.service ]]; then
                sudo cp "$file" "$target_dir/"
                echo -e "${GREEN}Copied $file to $target_dir/${NC}"
                
                service_name=$(basename "$file")
                
                # Check if the file contains "# DISABLE" comment
                if grep -q "# DISABLE" "$file"; then
                    echo -e "${YELLOW}Found DISABLE flag for $service_name${NC}"
                    
                    # Check if the service is enabled
                    if $systemctl_cmd is-enabled "$service_name" &>/dev/null; then
                        echo -e "${RED}$service_name is enabled. Disabling...${NC}"
                        $systemctl_cmd disable "$service_name"
                        echo -e "${GREEN}Disabled $service_name${NC}"
                    else
                        echo -e "${BLUE}$service_name is already disabled${NC}"
                    fi
                else
                    $systemctl_cmd daemon-reload
                    $systemctl_cmd enable "$service_name"
                    echo -e "${GREEN}Enabled $service_name${NC}"
                fi
            elif [[ -f "$file" ]]; then
                echo -e "${YELLOW}Skipping non-service file: $file${NC}"
            fi
        done
    fi
done

echo -e "${BLUE}Script execution completed.${NC}"
