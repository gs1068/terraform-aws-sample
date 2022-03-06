set -eu
# ステージング環境 or 本番環境のプロファイルを設定
export AWS_PROFILE=terraform-sample
aws configure list
echo 'アカウントをterraform-sampleへ切り替えました。'
set +eu