# 🚀 Hướng dẫn Tự động Bảo vệ Tất cả Repositories

Có 3 cách để tự động bảo vệ tất cả repositories:

## 📋 Cách 1: Sử dụng GitHub CLI (Khuyến nghị - Đơn giản nhất)

### Bước 1: Cài đặt GitHub CLI

**Windows:**
```bash
# Tải từ: https://cli.github.com/
# Hoặc dùng winget:
winget install --id GitHub.cli
```

**Linux/Mac:**
```bash
# Ubuntu/Debian
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Mac
brew install gh
```

### Bước 2: Đăng nhập GitHub CLI

```bash
gh auth login
```

Chọn:
- GitHub.com
- HTTPS
- Login with a web browser
- Authorize GitHub CLI

### Bước 3: Chạy script

**Windows:**
```bash
setup_repo_protection.bat
```

**Linux/Mac/Git Bash:**
```bash
chmod +x setup_repo_protection.sh
./setup_repo_protection.sh
```

---

## 📋 Cách 2: Sử dụng Python Script

### Bước 1: Cài đặt Python và PyGithub

```bash
pip install PyGithub
```

### Bước 2: Tạo GitHub Personal Access Token

1. Vào GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token (classic)
3. Chọn quyền: `repo` (Full control of private repositories)
4. Copy token

### Bước 3: Set token và chạy script

**Windows:**
```cmd
set GITHUB_TOKEN=your_token_here
python setup_repo_protection.py
```

**Linux/Mac:**
```bash
export GITHUB_TOKEN=your_token_here
python3 setup_repo_protection.py
```

---

## 📋 Cách 3: Sử dụng GitHub API trực tiếp (Nâng cao)

### Tạo Personal Access Token (giống Cách 2)

### Sử dụng curl:

```bash
# Set token
export GITHUB_TOKEN=your_token_here

# Bảo vệ branch cho từng repo
for repo in GunnyArena GunnyClient GunnyServer GunnyAdmin; do
    curl -X PUT \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/repos/vanloc19/$repo/branches/main/protection \
        -d '{
            "required_status_checks": {"strict": true, "contexts": []},
            "enforce_admins": true,
            "required_pull_request_reviews": {
                "required_approving_review_count": 1,
                "dismiss_stale_reviews": true
            },
            "allow_force_pushes": false,
            "allow_deletions": false
        }'
    
    # Tắt các tính năng
    curl -X PATCH \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/repos/vanloc19/$repo \
        -d '{
            "has_issues": false,
            "has_wiki": false,
            "has_projects": false,
            "has_discussions": false
        }'
done
```

---

## ✅ Kết quả sau khi chạy

Sau khi chạy script, tất cả repositories sẽ được bảo vệ:

- ✅ **Branch Protection Rules** đã được thiết lập cho branch `main`
- ✅ **Issues** đã được tắt
- ✅ **Wiki** đã được tắt
- ✅ **Projects** đã được tắt
- ✅ **Discussions** đã được tắt
- ✅ Không ai có thể push trực tiếp vào branch `main`
- ✅ Tất cả thay đổi phải thông qua Pull Request và được approve

---

## 🔍 Kiểm tra kết quả

Sau khi chạy script, kiểm tra trên GitHub:

1. Vào từng repository → Settings → Branches
2. Kiểm tra xem branch `main` đã có protection rules chưa
3. Vào Settings → General → Features
4. Kiểm tra xem Issues, Wiki, Projects, Discussions đã tắt chưa

---

## ⚠️ Lưu ý

- Script sẽ bảo vệ tất cả 4 repositories: GunnyArena, GunnyClient, GunnyServer, GunnyAdmin
- Nếu repository chưa có branch `main`, script sẽ báo lỗi (có thể đổi tên branch trong script)
- Bạn vẫn có thể push code từ local, nhưng phải tạo Pull Request và approve
- Để bypass protection (chỉ dành cho owner), vào Settings → Branches → Edit rule → Bỏ chọn "Do not allow bypassing"

---

## 🛠️ Troubleshooting

**Lỗi: "Repository not found"**
- Kiểm tra tên repository có đúng không
- Kiểm tra token có quyền truy cập repository không

**Lỗi: "Branch not found"**
- Kiểm tra branch có tên là `main` hay `master`
- Đổi tên branch trong script nếu cần

**Lỗi: "Authentication failed"**
- Đăng nhập lại: `gh auth login`
- Hoặc kiểm tra token còn hiệu lực không

