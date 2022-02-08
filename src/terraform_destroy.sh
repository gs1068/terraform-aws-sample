#!/bin/bash
set -eu

# ステージング環境 and 本番環境でTerraform destroyコマンドの定義
terraform_destroy_stage () {
    cd ./${DEPLOY}
    terraform fmt
    terraform workspace select stage
    terraform init
    terraform destroy -var-file=stage.tfvars
    cd ..
}

terraform_destroy_prod () {
    cd ./${DEPLOY}
    terraform fmt
    terraform workspace select prod
    terraform init
    terraform destroy -var-file=prod.tfvars
    cd ..
}

echo 'デプロイ先：ステージング環境 or 本番環境を入力してください。'
read -p 'ex) stage/prod:' ENV

# ステージング環境 or 本番環境でTerraform destroyコマンドを切り替える
if [ ${ENV} = 'stage' ]; then
    echo 'AWSリソース構築：step1 or step2 or step3を入力してください。'
    read -p 'ex) step1/step2/step3:' DEPLOY

    # step1 をデプロイ
    if [ ${DEPLOY} = 'step1' ]; then
        terraform_destroy_stage

    # step2 をデプロイ
    elif [ ${DEPLOY} = 'step2' ]; then
        terraform_destroy_stage

    # step3 をデプロイ
    elif [ ${DEPLOY} = 'step3' ]; then
        terraform_destroy_stage

    else
        echo '[step1] or [step2] or [step3] のいずれかを入力してください。'
    fi


elif [ ${ENV} = 'prod' ]; then
    # git checkout v1.0.0/${ENV}
    echo 'AWSリソース構築：step1 or step2 or step3を入力してください。'
    read -p 'ex) step1/step2/step3:' DEPLOY

    # step1 をデプロイ
    if [ ${DEPLOY} = 'step1' ]; then
        terraform_destroy_prod

    # step2 をデプロイ
    elif [ ${DEPLOY} = 'step2' ]; then
        terraform_destroy_prod

    # step3 をデプロイ
    elif [ ${DEPLOY} = 'step3' ]; then
        terraform_destroy_prod

    else
        echo '[step1] or [step2] or [step3] のいずれかを入力してください。'
    fi
    
else
    echo '[stage] or [prod] のどちらかを入力してください。'
fi