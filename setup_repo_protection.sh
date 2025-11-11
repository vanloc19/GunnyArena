#!/bin/bash

# Script tự động bảo vệ tất cả repositories trên GitHub
# Yêu cầu: Cài đặt GitHub CLI (gh) và đăng nhập: gh auth login

echo "🔒 Bắt đầu bảo vệ tất cả repositories..."

# Danh sách repositories
REPOS=(
    "vanloc19/GunnyArena"
    "vanloc19/GunnyClient"
    "vanloc19/GunnyServer"
    "vanloc19/GunnyAdmin"
)

# Branch cần bảo vệ
BRANCH="main"

for REPO in "${REPOS[@]}"; do
    echo ""
    echo "📦 Đang bảo vệ repository: $REPO"
    
    # Kiểm tra repository có tồn tại không
    if ! gh repo view "$REPO" &>/dev/null; then
        echo "⚠️  Repository $REPO không tồn tại hoặc không có quyền truy cập"
        continue
    fi
    
    # Tạo branch protection rule
    echo "  → Thiết lập Branch Protection Rules cho branch: $BRANCH"
    
    gh api repos/$REPO/branches/$BRANCH/protection \
        --method PUT \
        --field required_status_checks='{"strict":true,"contexts":[]}' \
        --field enforce_admins=true \
        --field required_pull_request_reviews='{"required_approving_review_count":1,"dismiss_stale_reviews":true,"require_code_owner_reviews":false}' \
        --field restrictions=null \
        --field required_linear_history=false \
        --field allow_force_pushes=false \
        --field allow_deletions=false \
        --field block_creations=false \
        --field required_conversation_resolution=false \
        --field lock_branch=false \
        --field allow_fork_syncing=false \
        2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "  ✅ Đã bảo vệ branch $BRANCH thành công"
    else
        echo "  ⚠️  Có lỗi khi bảo vệ branch (có thể đã được bảo vệ trước đó)"
    fi
    
    # Tắt Issues
    echo "  → Tắt Issues..."
    gh api repos/$REPO -X PATCH -f has_issues=false 2>/dev/null
    
    # Tắt Wiki
    echo "  → Tắt Wiki..."
    gh api repos/$REPO -X PATCH -f has_wiki=false 2>/dev/null
    
    # Tắt Projects
    echo "  → Tắt Projects..."
    gh api repos/$REPO -X PATCH -f has_projects=false 2>/dev/null
    
    # Tắt Discussions
    echo "  → Tắt Discussions..."
    gh api repos/$REPO -X PATCH -f has_discussions=false 2>/dev/null
    
    echo "  ✅ Hoàn tất bảo vệ $REPO"
done

echo ""
echo "🎉 Đã hoàn tất bảo vệ tất cả repositories!"
echo ""
echo "📝 Lưu ý:"
echo "   - Branch Protection Rules đã được thiết lập"
echo "   - Issues, Wiki, Projects, Discussions đã được tắt"
echo "   - Không ai có thể push trực tiếp vào branch main"
echo "   - Tất cả thay đổi phải thông qua Pull Request và được approve"

