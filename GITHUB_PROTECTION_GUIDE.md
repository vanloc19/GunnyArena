# 🔒 Hướng dẫn Bảo vệ Repository GitHub

## Các bước bảo vệ repository để ngăn chặn chỉnh sửa trái phép

### 1. Bảo vệ Branch chính (Branch Protection Rules)

**Đường dẫn:** `Settings` → `Branches` → `Add rule`

**Cấu hình:**
- **Branch name pattern:** `main` (hoặc `master`)
- **Bật các tùy chọn sau:**
  - ✅ `Require a pull request before merging`
    - ✅ `Require approvals: 1` (hoặc nhiều hơn)
    - ✅ `Dismiss stale pull request approvals when new commits are pushed`
    - ✅ `Require review from Code Owners` (nếu có file CODEOWNERS)
  - ✅ `Do not allow bypassing the above settings`
  - ✅ `Restrict pushes that create files larger than 100 MB`
  - ✅ `Block force pushes`
  - ✅ `Block deletions`

**Kết quả:** Không ai có thể push trực tiếp vào branch `main`, phải thông qua Pull Request và được approve.

---

### 2. Tắt các tính năng không cần thiết

**Đường dẫn:** `Settings` → `General` → Scroll xuống phần `Features`

**Tắt các tính năng:**
- ❌ `Issues` - Tắt nếu không muốn người khác tạo issues
- ❌ `Pull requests` - Tắt nếu không muốn nhận PR từ người khác
- ❌ `Wiki` - Tắt Wiki
- ❌ `Projects` - Tắt Projects
- ❌ `Discussions` - Tắt Discussions

**Lưu ý:** Nếu tắt Pull requests, bạn vẫn có thể tạo PR từ local, nhưng người khác không thể tạo PR vào repo của bạn.

---

### 3. Quản lý Collaborators

**Đường dẫn:** `Settings` → `Collaborators and teams`

**Các quyền:**
- **Read:** Chỉ đọc, không thể sửa
- **Write:** Có thể push code (nhưng vẫn bị Branch Protection Rules chặn nếu đã bật)
- **Admin:** Toàn quyền (chỉ nên cấp cho người tin cậy)

**Khuyến nghị:** 
- Không thêm Collaborators nếu không cần thiết
- Nếu thêm, chỉ cấp quyền **Read**

---

### 4. Bảo mật tài khoản (2FA)

**Đường dẫn:** `Settings` (của tài khoản) → `Security` → `Two-factor authentication`

**Bật 2FA để:**
- Bảo vệ tài khoản khỏi bị hack
- Ngăn chặn truy cập trái phép

---

### 5. Repository Visibility

**Đường dẫn:** `Settings` → `General` → Scroll xuống `Danger Zone` → `Change visibility`

**Các tùy chọn:**
- **Public:** Ai cũng có thể xem (nhưng không thể sửa nếu đã bật Branch Protection)
- **Private:** Chỉ người được mời mới xem được

**Khuyến nghị:** 
- Nếu muốn chia sẻ để học tập: Giữ **Public** + Bật **Branch Protection**
- Nếu muốn hoàn toàn riêng tư: Đổi sang **Private**

---

### 6. Tắt Fork (Nếu cần)

**Lưu ý:** GitHub không cho phép tắt hoàn toàn tính năng Fork cho Public repository.

**Giải pháp:**
- Đổi repository sang **Private** nếu không muốn ai fork
- Hoặc chấp nhận việc người khác có thể fork (họ chỉ fork về repo của họ, không ảnh hưởng repo của bạn)

---

### 7. Security Settings

**Đường dẫn:** `Settings` → `Security`

**Các tùy chọn:**
- ✅ `Dependency graph` - Bật để theo dõi dependencies
- ✅ `Dependabot alerts` - Bật để nhận cảnh báo bảo mật
- ✅ `Dependabot security updates` - Tự động cập nhật bảo mật

---

## ⚠️ Lưu ý quan trọng

1. **Branch Protection Rules là quan trọng nhất** - Nó ngăn chặn push trực tiếp vào branch chính
2. **Public repository vẫn có thể được bảo vệ** - Người khác có thể xem nhưng không thể sửa nếu đã bật Branch Protection
3. **Fork không ảnh hưởng repo gốc** - Khi ai đó fork, họ chỉ copy về repo của họ, không thể sửa repo của bạn
4. **Collaborators có quyền Write vẫn bị Branch Protection chặn** - Họ phải tạo Pull Request và được approve

---

## 📝 Checklist bảo vệ repository

- [ ] Bật Branch Protection Rules cho branch `main`
- [ ] Tắt Issues (nếu không cần)
- [ ] Tắt Pull Requests (nếu không muốn nhận PR từ người khác)
- [ ] Kiểm tra Collaborators - Chỉ thêm người tin cậy
- [ ] Bật 2FA cho tài khoản
- [ ] Kiểm tra Repository Visibility (Public/Private)
- [ ] Bật Security alerts

---

**Sau khi thực hiện các bước trên, repository của bạn sẽ được bảo vệ và người khác không thể sửa mã trực tiếp.**

