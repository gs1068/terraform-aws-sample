set -eu

create_bucket () {
    # step1のTerraform状態管理S3バケット作成
    echo 'step1のTerraform状態管理S3バケット作成中...'
    aws s3api create-bucket --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step1 --create-bucket-configuration LocationConstraint=ap-northeast-1
    aws s3api put-bucket-versioning --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step1 --versioning-configuration Status=Enabled
    aws s3api put-bucket-encryption --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step1 --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'
    aws s3api put-public-access-block --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step1 --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'

    # step2のTerraform状態管理S3バケット作成
    echo 'step2のTerraform状態管理S3バケット作成中...'
    aws s3api create-bucket --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step2 --create-bucket-configuration LocationConstraint=ap-northeast-1
    aws s3api put-bucket-versioning --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step2 --versioning-configuration Status=Enabled
    aws s3api put-bucket-encryption --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step2 --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'
    aws s3api put-public-access-block --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step2 --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'

    # step2のTerraform状態管理S3バケット作成
    echo 'step3のTerraform状態管理S3バケット作成中...'
    aws s3api create-bucket --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step3 --create-bucket-configuration LocationConstraint=ap-northeast-1
    aws s3api put-bucket-versioning --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step3 --versioning-configuration Status=Enabled
    aws s3api put-bucket-encryption --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step3 --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'
    aws s3api put-public-access-block --bucket terraform-sample-${S3_BUCKET_ENV}-tfstate-step3 --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'
}

# [source set_aws_profile.sh] を実行し、デプロイ先を指定しているか確認
if [ ${AWS_PROFILE} = 'terraform-sample' -o ${AWS_PROFILE} = 'terraform-sample-prod' ]; then
    :
else
    echo '[source set_aws_profile.sh] を実行し、デプロイ先を指定して下さい。'
    exit 1
fi

echo 'デプロイ先：ステージング環境 or 本番環境を入力してください。'
read -p 'ex) stage/prod:' ENV

# デプロイ環境ごとにS3バケットを作成
if [ ${ENV} = 'stage' ]; then
    export S3_BUCKET_ENV=stage
    create_bucket
    echo '----- terraform-sample-stage 全S3バケット作成完了 -----'
elif [ ${ENV} = 'prod' ]; then
    export S3_BUCKET_ENV=prod
    create_bucket
    echo '----- terraform-sample-prod 全S3バケット作成完了 -----'
else
    echo '[source set_aws_profile.sh] を実行し、デプロイ先を指定して下さい。'
fi

set +eu