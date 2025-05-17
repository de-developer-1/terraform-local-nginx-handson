# Terraformローカル環境構築ハンズオン - Nginx + Redis編

Terraformを使用してローカルマシン上にDockerベースのNginxおよびRedisサーバーを構築するハンズオン

## 前提条件

- Dockerインストール済
- Terraformインストール済（>= v1.0）

## ディレクトリ構成

- `terraform/`: Terraformの設定ファイル群
- `docker/`: Nginx設定ファイルとHTMLファイル
- `README.md`: 実行手順と解説

## 手順

```bash
cd terraform/

terraform init
terraform plan
terraform apply

# 結果確認（http://localhost:8080）
curl http://localhost:8080

# 後片付け
terraform destroy
```

## 複数コンテナ構成

- Nginx: 静的なWebページを表示
- Redis: 今後のAPI拡張やバックエンド用に活用

## アーキテクチャ

[ Browser ] ---> [ Nginx (8080) ]
                        |
                        V
              [ Redis (6379) - optional usage ]
