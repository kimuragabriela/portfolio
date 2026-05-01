#!/bin/bash

# ─────────────────────────────────────────────────────────────
# download-assets.sh
# Baixa todos os assets do Figma e atualiza os src no who.html
# Uso: bash download-assets.sh
# ─────────────────────────────────────────────────────────────

set -e

ASSETS_DIR="assets/images"
WHO_HTML="pages/who.html"

mkdir -p "$ASSETS_DIR"

echo "📥 Baixando assets do Figma..."

download() {
  local url="$1"
  local filename="$2"
  local dest="$ASSETS_DIR/$filename"

  if [ -f "$dest" ]; then
    echo "  ✓ $filename já existe, pulando."
    return
  fi

  echo "  ↓ $filename"
  curl -sL "$url" -o "$dest"

  if [ $? -eq 0 ] && [ -s "$dest" ]; then
    echo "    ✅ salvo em $dest"
  else
    echo "    ❌ falhou: $filename (link pode ter expirado)"
    rm -f "$dest"
  fi
}

# ── Assets da página WHO ──
download \
  "https://www.figma.com/api/mcp/asset/67503845-3937-4c58-8534-1b5a2d734dba" \
  "hero-name.png"

download \
  "https://www.figma.com/api/mcp/asset/16e620d5-773d-4e87-9df5-03bf246ccfd6" \
  "icon-gmail.svg"

download \
  "https://www.figma.com/api/mcp/asset/c745a2e0-fc24-4c38-8e96-c4b08a0b50fb" \
  "icon-linkedin.svg"

download \
  "https://www.figma.com/api/mcp/asset/e3a8bf4a-c784-4193-8637-18baa303fdd1" \
  "icon-instagram.svg"

download \
  "https://www.figma.com/api/mcp/asset/d9c95f57-316f-4cbf-8b01-6b00288c7e23" \
  "icon-instagram-footer.svg"

download \
  "https://www.figma.com/api/mcp/asset/1a10cd84-fc54-452a-925a-975a75be37af" \
  "icon-linkedin-footer.svg"

download \
  "https://www.figma.com/api/mcp/asset/4736dc03-e71a-4ece-97cd-641e8d25b458" \
  "icon-arrow-outward.svg"

echo ""
echo "🔄 Atualizando src no $WHO_HTML..."

# Substitui as URLs do Figma pelos caminhos locais
sed -i.bak \
  -e 's|https://www.figma.com/api/mcp/asset/67503845-3937-4c58-8534-1b5a2d734dba|../assets/images/hero-name.png|g' \
  -e 's|https://www.figma.com/api/mcp/asset/16e620d5-773d-4e87-9df5-03bf246ccfd6|../assets/images/icon-gmail.svg|g' \
  -e 's|https://www.figma.com/api/mcp/asset/c745a2e0-fc24-4c38-8e96-c4b08a0b50fb|../assets/images/icon-linkedin.svg|g' \
  -e 's|https://www.figma.com/api/mcp/asset/e3a8bf4a-c784-4193-8637-18baa303fdd1|../assets/images/icon-instagram.svg|g' \
  -e 's|https://www.figma.com/api/mcp/asset/d9c95f57-316f-4cbf-8b01-6b00288c7e23|../assets/images/icon-instagram-footer.svg|g' \
  -e 's|https://www.figma.com/api/mcp/asset/1a10cd84-fc54-452a-925a-975a75be37af|../assets/images/icon-linkedin-footer.svg|g' \
  -e 's|https://www.figma.com/api/mcp/asset/4736dc03-e71a-4ece-97cd-641e8d25b458|../assets/images/icon-arrow-outward.svg|g' \
  "$WHO_HTML"

# Remove o backup gerado pelo sed
rm -f "${WHO_HTML}.bak"

echo "  ✅ $WHO_HTML atualizado com caminhos locais"
echo ""
echo "────────────────────────────────────────"
echo "✅ Pronto! Assets salvos em $ASSETS_DIR/"
echo ""
echo "Próximo passo — commit e push:"
echo "  git add assets/images/ pages/who.html"
echo "  git commit -m \"add local asset images\""
echo "  git push"
echo "────────────────────────────────────────"
