#!/bin/bash

# Set imv as default for common image formats
echo "📷 Setting imv as default image viewer..."
xdg-mime default imv.desktop image/png
xdg-mime default imv.desktop image/jpeg
xdg-mime default imv.desktop image/jpg
xdg-mime default imv.desktop image/gif
xdg-mime default imv.desktop image/webp
xdg-mime default imv.desktop image/bmp
xdg-mime default imv.desktop image/tiff

# Set Zathura as default PDF viewer
echo "📄 Setting Zathura as default PDF viewer..."
xdg-mime default org.pwmt.zathura.desktop application/pdf

echo "✅ Done! imv and Zathura are now your default viewers."
