## 常用命令

### NixOS 初始安装
#### 远程部署

**lqh-pve-nixos**
```bash
nix run github:nix-community/nixos-anywhere -- --flake .#<name> --build-on-remote root@<IP>
```

```bash
nix run github:nix-community/nixos-anywhere -- --flake .#lqh-surface root@<IP>
```

#### 单机部署

```bash
git clone https://github.com/liqiha0/nix-config.git /mnt/config
cd /mnt/config

sudo nix run github:nix-community/disko -- --mode disko ./hosts/lqh-surface/disko-config.nix

sudo nixos-install --flake .#lqh-surface
```

---

### 硬件变更 (更新 Facter)
```bash
ssh root@<IP> "nix --extra-experimental-features 'nix-command flakes' run nixpkgs#nixos-facter -- -o /tmp/facter.json && cat /tmp/facter.json" > hosts/lqh-pve-nixos/facter.json
```

