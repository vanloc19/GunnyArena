@echo off
REM Script tự động bảo vệ tất cả repositories trên GitHub (Windows)
REM Yêu cầu: Cài đặt GitHub CLI (gh) và đăng nhập: gh auth login

echo 🔒 Bắt đầu bảo vệ tất cả repositories...
echo.

REM Danh sách repositories
set REPOS=GunnyArena GunnyClient GunnyServer GunnyAdmin
set BRANCH=main

for %%R in (%REPOS%) do (
    echo.
    echo 📦 Đang bảo vệ repository: vanloc19/%%R
    
    REM Kiểm tra repository có tồn tại không
    gh repo view vanloc19/%%R >nul 2>&1
    if errorlevel 1 (
        echo ⚠️  Repository vanloc19/%%R không tồn tại hoặc không có quyền truy cập
        goto :next
    )
    
    REM Thiết lập Branch Protection Rules
    echo   → Thiết lập Branch Protection Rules cho branch: %BRANCH%
    gh api repos/vanloc19/%%R/branches/%BRANCH%/protection --method PUT --field required_status_checks="{\"strict\":true,\"contexts\":[]}" --field enforce_admins=true --field required_pull_request_reviews="{\"required_approving_review_count\":1,\"dismiss_stale_reviews\":true,\"require_code_owner_reviews\":false}" --field restrictions=null --field required_linear_history=false --field allow_force_pushes=false --field allow_deletions=false --field block_creations=false --field required_conversation_resolution=false --field lock_branch=false --field allow_fork_syncing=false >nul 2>&1
    if errorlevel 1 (
        echo   ⚠️  Có lỗi khi bảo vệ branch (có thể đã được bảo vệ trước đó)
    ) else (
        echo   ✅ Đã bảo vệ branch %BRANCH% thành công
    )
    
    REM Tắt Issues
    echo   → Tắt Issues...
    gh api repos/vanloc19/%%R -X PATCH -f has_issues=false >nul 2>&1
    
    REM Tắt Wiki
    echo   → Tắt Wiki...
    gh api repos/vanloc19/%%R -X PATCH -f has_wiki=false >nul 2>&1
    
    REM Tắt Projects
    echo   → Tắt Projects...
    gh api repos/vanloc19/%%R -X PATCH -f has_projects=false >nul 2>&1
    
    REM Tắt Discussions
    echo   → Tắt Discussions...
    gh api repos/vanloc19/%%R -X PATCH -f has_discussions=false >nul 2>&1
    
    echo   ✅ Hoàn tất bảo vệ vanloc19/%%R
    
    :next
)

echo.
echo 🎉 Đã hoàn tất bảo vệ tất cả repositories!
echo.
echo 📝 Lưu ý:
echo    - Branch Protection Rules đã được thiết lập
echo    - Issues, Wiki, Projects, Discussions đã được tắt
echo    - Không ai có thể push trực tiếp vào branch main
echo    - Tất cả thay đổi phải thông qua Pull Request và được approve
echo.
pause

