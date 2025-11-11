#!/usr/bin/env python3
"""
Script tự động bảo vệ tất cả repositories trên GitHub
Yêu cầu: 
    - pip install PyGithub
    - Tạo GitHub Personal Access Token với quyền repo
    - Export token: export GITHUB_TOKEN=your_token
"""

import os
import sys
from github import Github

# Danh sách repositories cần bảo vệ
REPOS = [
    "vanloc19/GunnyArena",
    "vanloc19/GunnyClient",
    "vanloc19/GunnyServer",
    "vanloc19/GunnyAdmin",
]

# Branch cần bảo vệ
BRANCH = "main"

def setup_protection():
    # Lấy GitHub token
    token = os.getenv("GITHUB_TOKEN")
    if not token:
        print("❌ Lỗi: Chưa set GITHUB_TOKEN")
        print("   Vui lòng export GITHUB_TOKEN=your_token")
        sys.exit(1)
    
    # Kết nối GitHub
    try:
        g = Github(token)
        user = g.get_user()
        print(f"✅ Đã đăng nhập GitHub: {user.login}")
    except Exception as e:
        print(f"❌ Lỗi đăng nhập GitHub: {e}")
        sys.exit(1)
    
    print("\n🔒 Bắt đầu bảo vệ tất cả repositories...\n")
    
    for repo_name in REPOS:
        try:
            print(f"📦 Đang bảo vệ repository: {repo_name}")
            repo = g.get_repo(repo_name)
            
            # Thiết lập Branch Protection Rules
            print(f"  → Thiết lập Branch Protection Rules cho branch: {BRANCH}")
            try:
                branch = repo.get_branch(BRANCH)
                branch.edit_protection(
                    required_approving_review_count=1,
                    dismiss_stale_reviews=True,
                    require_code_owner_reviews=False,
                    enforce_admins=True,
                    allow_force_pushes=False,
                    allow_deletions=False,
                    block_creations=False,
                    required_conversation_resolution=False,
                    lock_branch=False,
                    allow_fork_syncing=False,
                )
                print(f"  ✅ Đã bảo vệ branch {BRANCH} thành công")
            except Exception as e:
                print(f"  ⚠️  Lỗi khi bảo vệ branch: {e}")
            
            # Tắt các tính năng
            print("  → Tắt Issues, Wiki, Projects, Discussions...")
            try:
                repo.edit(
                    has_issues=False,
                    has_wiki=False,
                    has_projects=False,
                    has_discussions=False,
                )
                print("  ✅ Đã tắt các tính năng không cần thiết")
            except Exception as e:
                print(f"  ⚠️  Lỗi khi tắt tính năng: {e}")
            
            print(f"  ✅ Hoàn tất bảo vệ {repo_name}\n")
            
        except Exception as e:
            print(f"  ❌ Lỗi khi xử lý {repo_name}: {e}\n")
    
    print("🎉 Đã hoàn tất bảo vệ tất cả repositories!")
    print("\n📝 Lưu ý:")
    print("   - Branch Protection Rules đã được thiết lập")
    print("   - Issues, Wiki, Projects, Discussions đã được tắt")
    print("   - Không ai có thể push trực tiếp vào branch main")
    print("   - Tất cả thay đổi phải thông qua Pull Request và được approve")

if __name__ == "__main__":
    setup_protection()

