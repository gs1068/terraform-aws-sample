set -eu

create_bucket () {
    # step1のTerraform状態管理S3バケット作成
    echo 'step1のTerraform状態管理S3バケット作成中...'
    aws s3api create-bucket --bucket terraform-aws-sample-step1 --create-bucket-configuration LocationConstraint=ap-northeast-1
    aws s3api put-bucket-versioning --bucket terraform-aws-sample-step1 --versioning-configuration Status=Enabled
    aws s3api put-bucket-encryption --bucket terraform-aws-sample-step1 --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'
    aws s3api put-public-access-block --bucket terraform-aws-sample-step1 --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'

    # step2のTerraform状態管理S3バケット作成
    echo 'step2のTerraform状態管理S3バケット作成中...'
    aws s3api create-bucket --bucket terraform-aws-sample-step2 --create-bucket-configuration LocationConstraint=ap-northeast-1
    aws s3api put-bucket-versioning --bucket terraform-aws-sample-step2 --versioning-configuration Status=Enabled
    aws s3api put-bucket-encryption --bucket terraform-aws-sample-step2 --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'
    aws s3api put-public-access-block --bucket terraform-aws-sample-step2 --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'

    # step2のTerraform状態管理S3バケット作成
    echo 'step3のTerraform状態管理S3バケット作成中...'
    aws s3api create-bucket --bucket terraform-aws-sample-step3 --create-bucket-configuration LocationConstraint=ap-northeast-1
    aws s3api put-bucket-versioning --bucket terraform-aws-sample-step3 --versioning-configuration Status=Enabled
    aws s3api put-bucket-encryption --bucket terraform-aws-sample-step3 --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'
    aws s3api put-public-access-block --bucket terraform-aws-sample-step3 --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'
}

create_bucket
echo '----- terraform-aws-sample-prod 全S3バケット作成完了 -----'

set +eu